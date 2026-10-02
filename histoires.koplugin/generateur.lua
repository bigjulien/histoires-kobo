--[[--
Moteur des histoires : chargement de la base, invention d'histoires à
partir de trames, et mise en forme.

Ce module n'utilise aucune API de KOReader : il tourne aussi avec un simple
interpréteur Lua (voir tests/), ce qui permet de vérifier toute la base
d'histoires sans liseuse.

Syntaxe des textes (trames et histoires) :
  {heros.nom}          champ d'un rôle (heros, compagnon, lieu, objet)
  {heros|il|elle}      choix selon le genre du rôle ("m" ou "f")
  {duo|Ils|Elles}      pluriel du héros et du compagnon
  {jeux}               tirage dans la liste "jeux" de la trame
  {coins#2.ou}         deuxième tirage (distinct du premier) dans "coins"
  {enfant}, {doudou}   prénom de l'enfant et son doudou (réglages)
  {^...}               met une majuscule au début du résultat
--]]

local Generateur = {}
Generateur.__index = Generateur

-- Champs obligatoires de chaque élément de la base. Une entrée
-- incomplète est écartée au chargement plutôt que de produire
-- une histoire trouée.
Generateur.CHAMPS = {
    personnages = { "id", "nom", "un", "le", "genre", "detail", "aime", "depasse", "maison", "gouter" },
    lieux = { "id", "nom", "dans", "de", "detail", "son", "cachette", "lit", "tresor" },
    objets = { "id", "son", "mon", "ton", "genre" },
    trames = { "id", "titre", "age_min", "age_max", "paragraphes" },
    histoires = { "id", "titre", "age_min", "age_max", "paragraphes" },
}

local SECTIONS = { "personnages", "lieux", "objets", "trames", "histoires" }

-- Espace insécable, pour que « ! » ou « ? » ne partent jamais seuls à
-- la ligne suivante.
local NBSP = "\194\160"

local MAJUSCULES = {
    ["à"] = "À", ["â"] = "Â", ["ç"] = "Ç", ["é"] = "É", ["è"] = "È",
    ["ê"] = "Ê", ["ë"] = "Ë", ["î"] = "Î", ["ï"] = "Ï", ["ô"] = "Ô",
    ["ù"] = "Ù", ["û"] = "Û", ["œ"] = "Œ",
}

local function majuscule(texte)
    local premier, reste = texte:match("^([\192-\223][\128-\191])(.*)$")
    if premier and MAJUSCULES[premier] then
        return MAJUSCULES[premier] .. reste
    end
    return (texte:gsub("^%l", string.upper))
end
Generateur.majuscule = majuscule

--- Générateur pseudo-aléatoire de Park-Miller : reproductible à partir
-- d'une graine, et exact avec les nombres flottants de Lua 5.1.
local function nouveauHasard(graine)
    local etat = math.floor(tonumber(graine) or os.time()) % 2147483647
    if etat <= 0 then etat = etat + 2147483646 end
    return function(n)
        etat = (etat * 16807) % 2147483647
        return (etat % n) + 1
    end
end
Generateur.nouveauHasard = nouveauHasard

local function piocher(liste, hasard)
    return liste[hasard(#liste)]
end

---------------------------------------------------------------------------
-- Chargement et vérification de la base
---------------------------------------------------------------------------

--- Charge un fichier de données Lua dans un environnement vide : un
-- fichier ajouté par l'utilisateur ne peut rien faire d'autre que
-- renvoyer une table.
function Generateur.lireFichier(chemin)
    local morceau, err = loadfile(chemin)
    if not morceau then return nil, err end
    setfenv(morceau, {})
    local ok, donnees = pcall(morceau)
    if not ok then return nil, donnees end
    if type(donnees) ~= "table" then
        return nil, chemin .. " : le fichier doit renvoyer une table"
    end
    return donnees
end

local function verifierEntree(section, entree)
    if type(entree) ~= "table" then return "entrée qui n'est pas une table" end
    for _, champ in ipairs(Generateur.CHAMPS[section]) do
        if entree[champ] == nil then
            return string.format("%s « %s » : champ « %s » manquant",
                section, tostring(entree.id or entree.nom or "?"), champ)
        end
    end
    if entree.genre and entree.genre ~= "m" and entree.genre ~= "f" then
        return string.format("%s « %s » : genre doit valoir \"m\" ou \"f\"", section, entree.id)
    end
end

--- Ajoute à `base` le contenu de `extra` ({personnages = {...}, ...}).
-- Une entrée qui reprend l'id d'une entrée existante la remplace, ce qui
-- permet de corriger une histoire fournie sans toucher au plugin.
-- Renvoie la liste des erreurs rencontrées.
function Generateur.fusionner(base, extra, origine)
    local erreurs = {}
    for _, section in ipairs(SECTIONS) do
        base[section] = base[section] or {}
        for _, entree in ipairs(extra[section] or {}) do
            local err = verifierEntree(section, entree)
            if err then
                table.insert(erreurs, (origine and origine .. " : " or "") .. err)
            else
                local remplace = false
                for i, existante in ipairs(base[section]) do
                    if existante.id == entree.id then
                        base[section][i] = entree
                        remplace = true
                        break
                    end
                end
                if not remplace then table.insert(base[section], entree) end
            end
        end
    end
    return erreurs
end

--- Charge la base fournie avec le plugin, puis les fichiers .lua du
-- dossier personnel s'il existe. Renvoie la base et les erreurs.
function Generateur.chargerBase(dossier_plugin, dossier_perso, lister)
    local base, erreurs = {}, {}
    local function ajouter(chemin)
        local donnees, err = Generateur.lireFichier(chemin)
        if not donnees then
            table.insert(erreurs, err)
            return
        end
        for _, e in ipairs(Generateur.fusionner(base, donnees, chemin)) do
            table.insert(erreurs, e)
        end
    end
    for _, nom in ipairs({ "personnages", "lieux", "objets", "trames", "histoires" }) do
        ajouter(dossier_plugin .. "/donnees/" .. nom .. ".lua")
    end
    if dossier_perso and lister then
        for _, chemin in ipairs(lister(dossier_perso)) do
            ajouter(chemin)
        end
    end
    return base, erreurs
end

---------------------------------------------------------------------------
-- Rendu des textes
---------------------------------------------------------------------------

local Contexte = {}
Contexte.__index = Contexte

function Contexte.new(roles, choix, hasard)
    return setmetatable({ roles = roles, choix = choix or {}, hasard = hasard, tirages = {} }, Contexte)
end

--- Renvoie la valeur d'un nom comme "heros", "jeux" ou "coins#2".
function Contexte:valeur(nom)
    local liste, rang = nom:match("^([%w_]+)#(%d+)$")
    liste = liste or nom
    rang = tonumber(rang) or 1
    if not nom:find("#") and self.roles[nom] ~= nil then
        return self.roles[nom]
    end
    local pool = self.choix[liste]
    if not pool then
        error("nom inconnu : " .. nom, 0)
    end
    -- Les tirages d'une même liste sont tous différents : on mélange une
    -- copie une fois pour toutes et on lit dans l'ordre.
    local ordre = self.tirages[liste]
    if not ordre then
        ordre = {}
        for i, v in ipairs(pool) do ordre[i] = v end
        for i = #ordre, 2, -1 do
            local j = self.hasard(i)
            ordre[i], ordre[j] = ordre[j], ordre[i]
        end
        self.tirages[liste] = ordre
    end
    if rang > #ordre then
        error(string.format("la liste « %s » n'a que %d éléments", liste, #ordre), 0)
    end
    return ordre[rang]
end

function Contexte:remplacer(expr)
    local cap = expr:sub(1, 1) == "^"
    if cap then expr = expr:sub(2) end
    local resultat
    local nom, masc, fem = expr:match("^([%w_#]+)|(.-)|(.*)$")
    if nom then
        local v = self:valeur(nom)
        if type(v) ~= "table" or not v.genre then
            error("pas de genre pour « " .. nom .. " »", 0)
        end
        resultat = v.genre == "f" and fem or masc
    else
        local champ
        nom, champ = expr:match("^([%w_#]+)%.([%w_]+)$")
        if nom then
            local v = self:valeur(nom)
            resultat = type(v) == "table" and v[champ] or nil
        else
            local v = self:valeur(expr)
            resultat = type(v) == "table" and v.nom or v
        end
    end
    if type(resultat) ~= "string" then
        error("rien pour « {" .. expr .. "} »", 0)
    end
    resultat = self:remplir(resultat)
    return cap and majuscule(resultat) or resultat
end

function Contexte:remplir(texte, profondeur)
    profondeur = (profondeur or 0) + 1
    if profondeur > 8 then error("remplacements en boucle", 0) end
    return (texte:gsub("{([^{}]+)}", function(expr)
        return self:remplacer(expr)
    end))
end

--- Typographie française : espaces insécables avant ! ? : ; » et après «.
local function typographier(texte)
    texte = texte:gsub(" ([!?:;»])", NBSP .. "%1")
    texte = texte:gsub("« ", "«" .. NBSP)
    return texte
end
Generateur.typographier = typographier

---------------------------------------------------------------------------
-- Le générateur
---------------------------------------------------------------------------

--- reglages : { prenom, genre ("f"/"m"), age (2 à 5), doudou, enfant_heros }
function Generateur.new(base, reglages)
    return setmetatable({ base = base, reglages = reglages or {} }, Generateur)
end

local function convient(entree, age)
    return not age or (entree.age_min <= age and age <= entree.age_max)
end

local function filtrer(liste, age)
    local res = {}
    for _, e in ipairs(liste or {}) do
        if convient(e, age) then table.insert(res, e) end
    end
    return res
end

function Generateur:age()
    return tonumber(self.reglages.age)
end

function Generateur:trames()
    return filtrer(self.base.trames, self:age())
end

function Generateur:histoires()
    local liste = filtrer(self.base.histoires, self:age())
    table.sort(liste, function(a, b) return a.titre < b.titre end)
    return liste
end

local function trouver(liste, id)
    for _, e in ipairs(liste or {}) do
        if e.id == id then return e end
    end
end

--- L'enfant, présenté comme un personnage, quand il est le héros.
function Generateur:enfantPersonnage()
    local r = self.reglages
    if not r.prenom or r.prenom == "" then return nil end
    local fille = r.genre == "f"
    return {
        id = "enfant",
        nom = r.prenom,
        genre = fille and "f" or "m",
        un = fille and "une petite fille" or "un petit garçon",
        le = fille and "la petite fille" or "le petit garçon",
        detail = "aux yeux qui pétillent",
        aime = "les histoires du soir",
        depasse = "le bout d'un petit pied",
        maison = "sa maison",
        gouter = "une bonne tartine de confiture",
    }
end

function Generateur:rolesCommuns()
    local r = self.reglages
    local prenom = (r.prenom and r.prenom ~= "") and r.prenom or "mon trésor"
    local doudou = (r.doudou and r.doudou ~= "") and ("ton doudou " .. r.doudou) or "ton doudou"
    return {
        enfant = { nom = prenom, genre = r.genre == "f" and "f" or "m" },
        doudou = { nom = doudou },
    }
end

local function variante(element, hasard)
    if type(element) == "table" then return piocher(element, hasard) end
    return element
end

--- Invente une histoire. opts (tous facultatifs) :
--   graine, trame (id), heros (id ou "enfant"), lieu (id), sauf_trame (id)
-- Renvoie { titre, paragraphes, source } ou nil, message.
function Generateur:inventer(opts)
    opts = opts or {}
    local hasard = nouveauHasard(opts.graine)
    local base = self.base

    local trame = opts.trame and trouver(base.trames, opts.trame)
    if not trame then
        local candidates = self:trames()
        if #candidates == 0 then return nil, "Aucune trame pour cet âge." end
        if #candidates > 1 and opts.sauf_trame then
            local autres = {}
            for _, t in ipairs(candidates) do
                if t.id ~= opts.sauf_trame then table.insert(autres, t) end
            end
            candidates = autres
        end
        trame = piocher(candidates, hasard)
    end

    local heros
    if opts.heros == "enfant" then
        heros = self:enfantPersonnage()
    elseif opts.heros then
        heros = trouver(base.personnages, opts.heros)
    elseif self.reglages.enfant_heros and self:enfantPersonnage() and hasard(3) == 1 then
        heros = self:enfantPersonnage()
    end
    heros = heros or piocher(base.personnages, hasard)

    local autres = {}
    for _, p in ipairs(base.personnages) do
        if p.id ~= heros.id then table.insert(autres, p) end
    end
    local compagnon = piocher(autres, hasard)

    local lieu = (opts.lieu and trouver(base.lieux, opts.lieu)) or piocher(base.lieux, hasard)
    local objet = piocher(base.objets, hasard)

    local roles = self:rolesCommuns()
    roles.heros, roles.compagnon, roles.lieu, roles.objet = heros, compagnon, lieu, objet
    roles.duo = { genre = (heros.genre == "f" and compagnon.genre == "f") and "f" or "m" }

    local ctx = Contexte.new(roles, trame.choix, hasard)
    local ok, histoire = pcall(function()
        local paragraphes = {}
        for _, p in ipairs(trame.paragraphes) do
            table.insert(paragraphes, typographier(ctx:remplir(variante(p, hasard))))
        end
        return {
            titre = typographier(majuscule(ctx:remplir(variante(trame.titre, hasard)))),
            paragraphes = paragraphes,
            source = "trame:" .. trame.id,
            trame = trame.id,
        }
    end)
    if not ok then
        return nil, string.format("Trame « %s » : %s", trame.id, histoire)
    end
    return histoire
end

--- Met en forme une histoire de la bibliothèque (remplace {enfant}, etc.).
function Generateur:raconter(histoire, graine)
    local hasard = nouveauHasard(graine)
    local ctx = Contexte.new(self:rolesCommuns(), histoire.choix, hasard)
    local ok, res = pcall(function()
        local paragraphes = {}
        for _, p in ipairs(histoire.paragraphes) do
            table.insert(paragraphes, typographier(ctx:remplir(variante(p, hasard))))
        end
        return {
            titre = typographier(ctx:remplir(histoire.titre)),
            paragraphes = paragraphes,
            source = "histoire:" .. histoire.id,
        }
    end)
    if not ok then
        return nil, string.format("Histoire « %s » : %s", histoire.id, res)
    end
    return res
end

function Generateur:histoireAuHasard(graine, sauf_id)
    local liste = self:histoires()
    if #liste == 0 then return nil, "Aucune histoire pour cet âge." end
    local hasard = nouveauHasard(graine)
    local h = piocher(liste, hasard)
    if #liste > 1 and h.id == sauf_id then
        repeat h = piocher(liste, hasard) until h.id ~= sauf_id
    end
    return self:raconter(h, graine)
end

---------------------------------------------------------------------------
-- Export HTML
---------------------------------------------------------------------------

local function echapper(texte)
    return (texte:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"))
end

--- Corps HTML (pour la fenêtre de lecture de KOReader, qui affiche déjà
-- le titre dans sa barre : `sans_titre` l'omet alors du texte).
function Generateur.versHTML(histoire, sans_titre)
    local morceaux = {}
    if not sans_titre then
        table.insert(morceaux, "<h2 style=\"text-align:center\">" .. echapper(histoire.titre) .. "</h2>")
    end
    for _, p in ipairs(histoire.paragraphes) do
        table.insert(morceaux, "<p>" .. echapper(p) .. "</p>")
    end
    return table.concat(morceaux, "\n")
end

--- Document HTML complet (pour l'ouvrir comme un livre dans KOReader).
function Generateur.versDocument(histoire)
    return table.concat({
        "<!DOCTYPE html>",
        "<html lang=\"fr\"><head><meta charset=\"utf-8\"/>",
        "<title>" .. echapper(histoire.titre) .. "</title>",
        "<style>body{line-height:1.5} p{text-indent:0;margin:0 0 0.8em 0} h2{margin-bottom:1em}</style>",
        "</head><body>",
        Generateur.versHTML(histoire),
        "</body></html>",
    }, "\n")
end

return Generateur
