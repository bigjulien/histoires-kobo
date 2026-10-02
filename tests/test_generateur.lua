-- Vérifie toute la base d'histoires sans liseuse.
-- Lancer depuis la racine du dépôt :  luajit tests/test_generateur.lua
-- Option : luajit tests/test_generateur.lua exemple   (affiche une histoire)

local PLUGIN = "histoires.koplugin"
local G = dofile(PLUGIN .. "/generateur.lua")

local echecs = 0
local function echec(msg)
    echecs = echecs + 1
    print("ÉCHEC : " .. msg)
end

local base, erreurs = G.chargerBase(PLUGIN)
for _, e in ipairs(erreurs) do echec("chargement : " .. e) end

-- Le fichier d'exemple pour les ajouts personnels doit lui aussi être valide.
local exemple, err = G.lireFichier("exemples/mes-histoires.lua")
if not exemple then
    echec("exemple : " .. tostring(err))
else
    local copie = G.chargerBase(PLUGIN)
    for _, e in ipairs(G.fusionner(copie, exemple, "exemple")) do echec(e) end
    for _, t in ipairs(exemple.trames or {}) do
        local gen = G.new(copie, { age = t.age_min })
        for graine = 1, 50 do
            local h, e = gen:inventer({ trame = t.id, graine = graine })
            if not h then echec(e) break end
        end
    end
end

-- Règle d'écriture : pas de « de {x.nom} » ni « que {x.nom} » (élision).
local function lint(id, texte)
    for _, motif in ipairs({ "%f[%a]de {[%^]?[%w_#]+%.nom}", "%f[%a]que {[%^]?[%w_#]+%.nom}",
                             "%f[%a]de {enfant}", "%f[%a]que {enfant}" }) do
        if texte:find(motif) then echec(id .. " : élision impossible dans « " .. texte .. " »") end
    end
end
local function textes(entree)
    local res = {}
    local function ajouter(x)
        if type(x) == "string" then table.insert(res, x)
        elseif type(x) == "table" then for _, v in pairs(x) do ajouter(v) end end
    end
    ajouter(entree.titre); ajouter(entree.paragraphes); ajouter(entree.choix)
    return res
end
for _, section in ipairs({ "trames", "histoires" }) do
    for _, e in ipairs(base[section]) do
        for _, t in ipairs(textes(e)) do lint(e.id, t) end
    end
end

local function verifierRendu(h, quoi)
    local tout = h.titre .. "\n" .. table.concat(h.paragraphes, "\n")
    if tout:find("[{}]") then echec(quoi .. " : accolade restante\n" .. tout) end
    if tout:find("nil") then echec(quoi .. " : « nil » dans le texte") end
    if tout:find("  ") then echec(quoi .. " : double espace") end
    if tout:find(" [!?:;»]") then echec(quoi .. " : espace sécable avant la ponctuation") end
    -- Contractions et élisions oubliées : « que une », « de le », « à les »...
    local bas = " " .. tout:lower():gsub("\n", " ")
    for _, motif in ipairs({ " que [aeiouy]", " de [aeiouy]", " de le ", " de les ", " à le ", " à les ",
                             " le [aeiouy]", " la [aeiouy]" }) do
        local debut = bas:find(motif)
        if debut then echec(quoi .. " : « " .. bas:sub(debut, debut + 20) .. " »") end
    end
end

-- Chaque âge doit avoir de quoi faire.
for age = 2, 5 do
    local gen = G.new(base, { age = age })
    if #gen:trames() < 2 then echec("âge " .. age .. " : moins de 2 trames") end
    if #gen:histoires() < 2 then echec("âge " .. age .. " : moins de 2 histoires") end
end

-- Toutes les trames, avec tous les héros (animaux et enfant), tous les lieux.
local reglages = {
    { prenom = "Emma", genre = "f", doudou = "Nounours" },
    { prenom = "Hugo", genre = "m" },
    {},
}
local rendus = 0
for _, r in ipairs(reglages) do
    local gen = G.new(base, r)
    local heros = { "enfant" }
    for _, p in ipairs(base.personnages) do table.insert(heros, p.id) end
    for _, t in ipairs(base.trames) do
        for _, hid in ipairs(r.prenom and heros or { nil }) do
            for _, l in ipairs(base.lieux) do
                for graine = 1, 6 do
                    local h, e = gen:inventer({ trame = t.id, heros = hid, lieu = l.id, graine = graine * 7919 })
                    if not h then echec(e) else verifierRendu(h, t.id .. "/" .. tostring(hid) .. "/" .. l.id) end
                    rendus = rendus + 1
                end
            end
        end
    end
    for _, hist in ipairs(base.histoires) do
        local h, e = gen:raconter(hist)
        if not h then echec(e) else verifierRendu(h, hist.id) end
    end
end

-- Même graine, même histoire.
local gen = G.new(base, { age = 4 })
local a, b = gen:inventer({ graine = 42 }), gen:inventer({ graine = 42 })
if G.versHTML(a) ~= G.versHTML(b) then echec("la graine ne rend pas l'histoire reproductible") end

-- Majuscules accentuées.
if G.majuscule("été") ~= "Été" then echec("majuscule accentuée") end

if arg[1] == "exemple" then
    local h = G.new(base, { age = tonumber(arg[3]) or 4, prenom = "Emma", genre = "f", enfant_heros = true })
        :inventer({ graine = tonumber(arg[2]) or os.time() })
    print("\n" .. h.titre .. "\n")
    for _, p in ipairs(h.paragraphes) do print(p .. "\n") end
end

print(string.format("%d histoires générées et vérifiées, %d échec(s).", rendus, echecs))
os.exit(echecs == 0 and 0 or 1)
