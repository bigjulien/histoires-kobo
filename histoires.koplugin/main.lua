--[[--
Histoires : des histoires en français pour les 2 à 5 ans, sur KOReader.

L'interface est ici ; le moteur (base, trames, rendu) est dans
generateur.lua, qui ne dépend pas de KOReader.

@module koplugin.histoires
--]]

local ButtonDialog = require("ui/widget/buttondialog")
local ConfirmBox = require("ui/widget/confirmbox")
local DataStorage = require("datastorage")
local Dispatcher = require("dispatcher")
local InfoMessage = require("ui/widget/infomessage")
local InputDialog = require("ui/widget/inputdialog")
local LuaSettings = require("luasettings")
local Menu = require("ui/widget/menu")
local TextViewer = require("ui/widget/textviewer")
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local lfs = require("libs/libkoreader-lfs")
local logger = require("logger")

-- Fichier déposé par l'entrée NickelMenu : s'il existe au démarrage de
-- KOReader, on ouvre directement l'accueil des histoires.
local FICHIER_OUVERTURE = "/tmp/histoires-kobo.ouvrir"
local AGES = { 2, 3, 4, 5 }

local Histoires = WidgetContainer:extend{
    name = "histoires",
    is_doc_only = false,
}

function Histoires:init()
    self.Generateur = dofile(self.path .. "/generateur.lua")
    self.reglages = LuaSettings:open(DataStorage:getSettingsDir() .. "/histoires.lua")
    self.dossier_perso = DataStorage:getDataDir() .. "/histoires"
    self:chargerBase()
    self:onDispatcherRegisterActions()
    self.ui.menu:registerToMainMenu(self)

    if lfs.attributes(FICHIER_OUVERTURE, "mode") == "file" then
        os.remove(FICHIER_OUVERTURE)
        UIManager:nextTick(function() self:accueil() end)
    end
end

function Histoires:onDispatcherRegisterActions()
    Dispatcher:registerAction("histoires_accueil", {
        category = "none", event = "HistoiresAccueil", title = "Histoires : accueil", general = true,
    })
    Dispatcher:registerAction("histoires_hasard", {
        category = "none", event = "HistoiresHasard", title = "Histoires : une histoire inventée", general = true,
    })
end

function Histoires:addToMainMenu(menu_items)
    menu_items.histoires = {
        text = "Histoires",
        sorting_hint = "tools",
        callback = function() self:accueil() end,
    }
end

function Histoires:onHistoiresAccueil()
    self:accueil()
    return true
end

function Histoires:onHistoiresHasard()
    self:inventer()
    return true
end

---------------------------------------------------------------------------
-- Base et réglages
---------------------------------------------------------------------------

local function listerLua(dossier)
    local fichiers = {}
    if lfs.attributes(dossier, "mode") ~= "directory" then return fichiers end
    for nom in lfs.dir(dossier) do
        if nom:match("%.lua$") and not nom:match("^%.") then
            table.insert(fichiers, dossier .. "/" .. nom)
        end
    end
    table.sort(fichiers)
    return fichiers
end

function Histoires:chargerBase()
    self.base, self.erreurs = self.Generateur.chargerBase(self.path, self.dossier_perso, listerLua)
    for _, e in ipairs(self.erreurs) do
        logger.warn("Histoires :", e)
    end
end

function Histoires:lire(cle, defaut)
    local v = self.reglages:readSetting(cle)
    if v == nil then return defaut end
    return v
end

function Histoires:ecrire(cle, valeur)
    self.reglages:saveSetting(cle, valeur)
    self.reglages:flush()
end

function Histoires:generateur()
    return self.Generateur.new(self.base, {
        prenom = self:lire("prenom", ""),
        genre = self:lire("genre", "f"),
        age = self:lire("age", 4),
        doudou = self:lire("doudou", ""),
        enfant_heros = self:lire("enfant_heros", true),
    })
end

local function graine()
    -- os.time() seul donnerait la même histoire deux fois dans la même seconde.
    return os.time() * 1000 + math.floor((os.clock() * 1000000) % 1000)
end

---------------------------------------------------------------------------
-- Écrans
---------------------------------------------------------------------------

function Histoires:fermerAccueil()
    if self.dialogue then
        UIManager:close(self.dialogue)
        self.dialogue = nil
    end
end

function Histoires:accueil()
    self:fermerAccueil()
    local prenom = self:lire("prenom", "")
    local function bouton(texte, action)
        return { text = texte, callback = function()
            self:fermerAccueil()
            action()
        end }
    end
    self.dialogue = ButtonDialog:new{
        title = prenom ~= "" and ("Les histoires de " .. prenom) or "Les histoires du soir",
        title_align = "center",
        buttons = {
            { bouton("Une histoire inventée", function() self:inventer() end) },
            { bouton("Choisir le héros et le lieu", function() self:choisirHeros() end) },
            {
                bouton("Une histoire du livre", function() self:histoireDuLivre() end),
                bouton("Toutes les histoires", function() self:bibliotheque() end),
            },
            { bouton("Mes histoires préférées", function() self:favoris() end) },
            {
                bouton("Réglages", function() self:ecranReglages() end),
                bouton("Fermer", function() end),
            },
        },
    }
    UIManager:show(self.dialogue)
end

--- Affiche une histoire. `suivante` (facultatif) produit l'histoire du
-- bouton « Une autre ! ».
function Histoires:afficher(histoire, suivante, favori_index)
    local viewer
    local function fermer() UIManager:close(viewer) end
    local premiere_ligne = {}
    if suivante then
        table.insert(premiere_ligne, { text = "Une autre !", callback = function()
            fermer()
            local h, err = suivante()
            if h then self:afficher(h, suivante) else self:erreur(err) end
        end })
    end
    if favori_index then
        table.insert(premiere_ligne, { text = "Retirer des préférées", callback = function()
            UIManager:show(ConfirmBox:new{
                text = "Retirer « " .. histoire.titre .. " » des histoires préférées ?",
                ok_text = "Retirer",
                cancel_text = "Garder",
                ok_callback = function()
                    local favoris = self:lire("favoris", {})
                    table.remove(favoris, favori_index)
                    self:ecrire("favoris", favoris)
                    fermer()
                    self:favoris()
                end,
            })
        end })
    else
        table.insert(premiere_ligne, { text = "Garder", callback = function()
            self:garder(histoire)
        end })
    end
    viewer = TextViewer:new{
        title = histoire.titre,
        text = self.Generateur.versHTML(histoire, true),
        text_format = "html",
        lang = "fr",
        text_type = "histoires",
        text_types = { histoires = { monospace_font = false, font_size = 24, justified = true } },
        buttons_table = {
            premiere_ligne,
            {
                { text = "Lire comme un livre", callback = function()
                    fermer()
                    self:ouvrirCommeLivre(histoire)
                end },
                { text = "Retour", callback = function()
                    fermer()
                    self:accueil()
                end },
            },
        },
    }
    UIManager:show(viewer)
end

function Histoires:erreur(message)
    UIManager:show(InfoMessage:new{ text = message or "Impossible de créer une histoire." })
end

function Histoires:inventer(opts)
    local gen = self:generateur()
    local derniere
    local function suivante()
        local o = {}
        for k, v in pairs(opts or {}) do o[k] = v end
        o.graine = graine()
        o.sauf_trame = derniere
        local h, err = gen:inventer(o)
        if h then derniere = h.trame end
        return h, err
    end
    local h, err = suivante()
    if h then self:afficher(h, suivante) else self:erreur(err) end
end

function Histoires:histoireDuLivre()
    local gen = self:generateur()
    local derniere
    local function suivante()
        local h, err = gen:histoireAuHasard(graine(), derniere)
        if h then derniere = h.source:match("^histoire:(.*)$") end
        return h, err
    end
    local h, err = suivante()
    if h then self:afficher(h, suivante) else self:erreur(err) end
end

local function afficherMenu(titre, items)
    local menu
    menu = Menu:new{
        title = titre,
        item_table = items,
        covers_fullscreen = true,
        is_borderless = true,
        is_popout = false,
        close_callback = function() UIManager:close(menu) end,
    }
    UIManager:show(menu)
end

function Histoires:bibliotheque()
    local gen = self:generateur()
    local items = {}
    for _, hist in ipairs(gen:histoires()) do
        table.insert(items, {
            text = hist.titre,
            callback = function()
                local h, err = gen:raconter(hist, graine())
                if h then self:afficher(h) else self:erreur(err) end
            end,
        })
    end
    if #items == 0 then
        return self:erreur("Aucune histoire du livre pour cet âge.")
    end
    afficherMenu("Toutes les histoires (" .. self:lire("age", 4) .. " ans)", items)
end

function Histoires:choisirHeros()
    local items = {}
    local prenom = self:lire("prenom", "")
    if prenom ~= "" then
        table.insert(items, { text = prenom, callback = function() self:choisirLieu("enfant", prenom) end })
    end
    for _, p in ipairs(self.base.personnages) do
        local texte = p.nom .. ", " .. p.le
        table.insert(items, { text = texte, callback = function() self:choisirLieu(p.id, p.nom) end })
    end
    afficherMenu("Qui est le héros ?", items)
end

function Histoires:choisirLieu(heros_id, heros_nom)
    local items = {
        { text = "Au hasard", callback = function() self:inventer({ heros = heros_id }) end },
    }
    for _, l in ipairs(self.base.lieux) do
        table.insert(items, {
            text = self.Generateur.majuscule(l.nom),
            callback = function() self:inventer({ heros = heros_id, lieu = l.id }) end,
        })
    end
    afficherMenu("Où va " .. heros_nom .. " ?", items)
end

---------------------------------------------------------------------------
-- Histoires préférées et lecture comme un livre
---------------------------------------------------------------------------

function Histoires:garder(histoire)
    local favoris = self:lire("favoris", {})
    for _, f in ipairs(favoris) do
        if f.titre == histoire.titre and f.paragraphes[1] == histoire.paragraphes[1] then
            return UIManager:show(InfoMessage:new{ text = "Cette histoire est déjà dans les préférées.", timeout = 2 })
        end
    end
    -- On garde le texte lui-même : il restera identique même si la base change.
    table.insert(favoris, 1, { titre = histoire.titre, paragraphes = histoire.paragraphes })
    self:ecrire("favoris", favoris)
    UIManager:show(InfoMessage:new{ text = "Histoire gardée dans les préférées.", timeout = 2 })
end

function Histoires:favoris()
    local favoris = self:lire("favoris", {})
    if #favoris == 0 then
        return self:erreur("Aucune histoire préférée pour l'instant. Touchez « Garder » sous une histoire pour la retrouver ici.")
    end
    local items = {}
    for i, f in ipairs(favoris) do
        table.insert(items, { text = f.titre, callback = function() self:afficher(f, nil, i) end })
    end
    afficherMenu("Mes histoires préférées", items)
end

local function nomDeFichier(titre)
    local accents = {
        ["à"] = "a", ["â"] = "a", ["ç"] = "c", ["é"] = "e", ["è"] = "e", ["ê"] = "e", ["ë"] = "e",
        ["î"] = "i", ["ï"] = "i", ["ô"] = "o", ["ù"] = "u", ["û"] = "u", ["œ"] = "oe",
    }
    local nom = titre:lower():gsub("[\192-\223][\128-\191]", function(c) return accents[c] or "" end)
    nom = nom:gsub("[^%w]+", "-"):gsub("^%-+", ""):gsub("%-+$", "")
    if nom == "" then nom = "histoire" end
    return nom:sub(1, 60) .. ".html"
end

--- Ouvre l'histoire dans le lecteur de KOReader : vraie mise en page,
-- pages à tourner, et réglages de police du lecteur.
function Histoires:ouvrirCommeLivre(histoire)
    local dossier = DataStorage:getDataDir() .. "/histoires-lues"
    if lfs.attributes(dossier, "mode") ~= "directory" then lfs.mkdir(dossier) end
    local chemin = dossier .. "/" .. nomDeFichier(histoire.titre)
    local f = io.open(chemin, "w")
    if not f then return self:erreur("Impossible d'écrire " .. chemin) end
    f:write(self.Generateur.versDocument(histoire))
    f:close()
    if self.ui.document then
        -- Déjà dans le lecteur : on change de document proprement. Ouvrir un
        -- second lecteur par-dessus laisserait l'ancien recevoir les gestes
        -- alors que son document est fermé.
        self.ui:switchDocument(chemin)
    else
        local ReaderUI = require("apps/reader/readerui")
        ReaderUI:showReader(chemin)
    end
end

---------------------------------------------------------------------------
-- Réglages
---------------------------------------------------------------------------

function Histoires:demanderTexte(titre, cle, aide)
    local dialogue
    dialogue = InputDialog:new{
        title = titre,
        input = self:lire(cle, ""),
        description = aide,
        buttons = {{
            { text = "Annuler", id = "close", callback = function()
                UIManager:close(dialogue)
                self:ecranReglages()
            end },
            { text = "Enregistrer", is_enter_default = true, callback = function()
                local texte = dialogue:getInputText():gsub("^%s+", ""):gsub("%s+$", "")
                self:ecrire(cle, texte)
                UIManager:close(dialogue)
                self:ecranReglages()
            end },
        }},
    }
    UIManager:show(dialogue)
    dialogue:onShowKeyboard()
end

function Histoires:ecranReglages()
    self:fermerAccueil()
    local prenom = self:lire("prenom", "")
    local genre = self:lire("genre", "f")
    local age = self:lire("age", 4)
    local doudou = self:lire("doudou", "")
    local enfant_heros = self:lire("enfant_heros", true)

    local function coche(actif, texte) return (actif and "✓ " or "") .. texte end
    local function changer(cle, valeur)
        return function()
            self:ecrire(cle, valeur)
            self:ecranReglages()
        end
    end

    local ligne_ages = {}
    for _, a in ipairs(AGES) do
        table.insert(ligne_ages, { text = coche(a == age, a .. " ans"), callback = changer("age", a) })
    end

    local function action(texte, f)
        return { text = texte, callback = function()
            self:fermerAccueil()
            f()
        end }
    end

    self.dialogue = ButtonDialog:new{
        title = "Réglages des histoires",
        title_align = "center",
        buttons = {
            { action("Prénom : " .. (prenom ~= "" and prenom or "(aucun)"), function()
                self:demanderTexte("Prénom de l'enfant", "prenom",
                    "Il apparaît dans les histoires, et l'enfant peut en devenir le héros.")
            end) },
            {
                { text = coche(genre == "f", "Fille"), callback = changer("genre", "f") },
                { text = coche(genre == "m", "Garçon"), callback = changer("genre", "m") },
            },
            ligne_ages,
            { action("Doudou : " .. (doudou ~= "" and doudou or "(aucun)"), function()
                self:demanderTexte("Nom du doudou", "doudou", "Par exemple : Nounours. Laisser vide pour « ton doudou ».")
            end) },
            { {
                text = coche(enfant_heros, "L'enfant est parfois le héros"),
                callback = changer("enfant_heros", not enfant_heros),
            } },
            { action("Recharger la base d'histoires", function()
                self:chargerBase()
                local texte = string.format("%d histoires écrites, %d trames complètes, %d intrigues.\n%d trames différentes possibles pour %d ans.",
                    #self.base.histoires, #self.base.trames, #self.base.intrigues,
                    self:generateur():nombreDeTrames(), self:lire("age", 4))
                if #self.erreurs > 0 then
                    texte = texte .. "\n\nProblèmes trouvés :\n" .. table.concat(self.erreurs, "\n")
                end
                UIManager:show(InfoMessage:new{ text = texte })
            end) },
            { action("Retour", function() self:accueil() end) },
        },
    }
    UIManager:show(self.dialogue)
end

return Histoires
