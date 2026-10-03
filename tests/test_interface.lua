-- Fait tourner main.lua avec de faux widgets KOReader, pour attraper les
-- erreurs de script (variable nil, mauvais appel) sans liseuse.
-- Lancer depuis la racine du dépôt :  luajit tests/test_interface.lua

local tmp = os.getenv("TMPDIR") or "/tmp"
local donnees = tmp .. "/histoires-test-" .. os.time()
os.execute("mkdir -p " .. donnees .. "/settings " .. donnees .. "/histoires")
os.execute("cp exemples/mes-histoires.lua " .. donnees .. "/histoires/")

local montres = {}
local function widget(nom)
    local W = {}
    W.__index = W
    W.extend = function(self, o) o = o or {}; o.__index = o; return setmetatable(o, { __index = self }) end
    W.new = function(self, o) o = o or {}; o._type = nom; setmetatable(o, self); if o.init then o:init() end; return o end
    return W
end
local UIManager = {
    show = function(_, w) table.insert(montres, w) end,
    close = function(_, w) for i, x in ipairs(montres) do if x == w then table.remove(montres, i) end end end,
    nextTick = function(_, f) f() end,
}
local reglages = {}
local stubs = {
    ["ui/widget/buttondialog"] = widget("ButtonDialog"),
    ["ui/widget/confirmbox"] = widget("ConfirmBox"),
    ["ui/widget/infomessage"] = widget("InfoMessage"),
    ["ui/widget/menu"] = widget("Menu"),
    ["ui/widget/textviewer"] = widget("TextViewer"),
    ["ui/widget/container/widgetcontainer"] = widget("WidgetContainer"),
    ["ui/uimanager"] = UIManager,
    ["datastorage"] = { getDataDir = function() return donnees end, getSettingsDir = function() return donnees .. "/settings" end },
    ["dispatcher"] = { registerAction = function() end },
    ["logger"] = { warn = function(...) print("warn", ...) end },
    ["luasettings"] = { open = function() return {
        readSetting = function(_, k) return reglages[k] end,
        saveSetting = function(_, k, v) reglages[k] = v end,
        flush = function() end,
    } end },
    ["libs/libkoreader-lfs"] = {
        attributes = function(p, _) local f = io.open(p) if not f then return nil end f:close()
            return (os.execute("test -d " .. p) == 0 or os.execute("test -d " .. p) == true) and "directory" or "file" end,
        dir = function(p) local h = io.popen("ls " .. p) local t = {} for l in h:lines() do t[#t + 1] = l end h:close()
            local i = 0 return function() i = i + 1 return t[i] end end,
        mkdir = function(p) os.execute("mkdir -p " .. p) end,
    },
    ["apps/reader/readerui"] = { showReader = function(_, chemin) table.insert(montres, { _type = "Reader", chemin = chemin }) end },
}
local InputDialog = widget("InputDialog")
InputDialog.getInputText = function(self) return self._saisie or "  Léa  " end
InputDialog.onShowKeyboard = function() end
stubs["ui/widget/inputdialog"] = InputDialog
local vrai_require = require
require = function(nom) return stubs[nom] or vrai_require(nom) end

local Histoires = dofile("histoires.koplugin/main.lua")
local menu_items = {}
local plugin = Histoires:new{ path = "histoires.koplugin", ui = { menu = { registerToMainMenu = function(_, p) p:addToMainMenu(menu_items) end } } }

local echecs = 0
local function verifier(cond, msg) if not cond then echecs = echecs + 1 print("ÉCHEC : " .. msg) end end
local function dernier() return montres[#montres] end
local function bouton(w, texte)
    for _, ligne in ipairs(w.buttons or w.buttons_table) do
        for _, b in ipairs(ligne) do if b.text:find(texte, 1, true) then return b end end
    end
    error("bouton introuvable : " .. texte)
end

verifier(#plugin.erreurs == 0, "erreurs de chargement : " .. table.concat(plugin.erreurs, " / "))
verifier(#plugin.base.personnages == 13, "le personnage de l'exemple n'est pas chargé")
menu_items.histoires.callback()
verifier(dernier()._type == "ButtonDialog", "l'accueil ne s'ouvre pas")

-- Réglages : prénom, âge, genre.
bouton(dernier(), "Réglages").callback()
bouton(dernier(), "Prénom").callback()
bouton(dernier(), "Enregistrer").callback()
verifier(reglages.prenom == "Léa", "prénom non enregistré : " .. tostring(reglages.prenom))
bouton(dernier(), "2 ans").callback()
verifier(reglages.age == 2, "âge non enregistré")
bouton(dernier(), "Garçon").callback()
bouton(dernier(), "Fille").callback()
bouton(dernier(), "Recharger").callback()
verifier(dernier()._type == "InfoMessage", "recharger n'affiche rien")
montres = {}

-- Histoire inventée, puis une autre, garder, lire comme un livre.
plugin:accueil()
bouton(dernier(), "Une histoire inventée").callback()
local v = dernier()
verifier(v._type == "TextViewer" and v.text:find("<p>"), "pas d'histoire affichée")
bouton(v, "Une autre").callback()
verifier(dernier() ~= v and dernier()._type == "TextViewer", "« Une autre ! » ne remplace pas l'histoire")
bouton(dernier(), "Garder").callback()
verifier(#reglages.favoris == 1, "histoire non gardée")
bouton(montres[#montres - 1], "Lire comme un livre").callback()
verifier(dernier()._type == "Reader" and io.open(dernier().chemin), "fichier HTML non créé")

-- Héros choisi, bibliothèque, préférées.
montres = {}
plugin:choisirHeros()
local m = dernier()
verifier(m.item_table[1].text == "Léa", "l'enfant n'est pas proposé comme héros")
m.item_table[1].callback()
dernier().item_table[2].callback()
verifier(dernier()._type == "TextViewer" and dernier().text:find("Léa"), "le héros choisi n'est pas dans l'histoire")
plugin:bibliotheque()
dernier().item_table[1].callback()
verifier(dernier()._type == "TextViewer", "la bibliothèque n'ouvre pas d'histoire")
plugin:histoireDuLivre()
verifier(dernier()._type == "TextViewer", "histoire du livre au hasard")
plugin:favoris()
dernier().item_table[1].callback()
bouton(dernier(), "Retirer").callback()
dernier().ok_callback()
verifier(#reglages.favoris == 0, "histoire non retirée")

-- « Lire comme un livre » depuis le lecteur : changer de document, sans
-- ouvrir un second lecteur par-dessus le premier.
montres = {}
local change = nil
local dans_lecteur = Histoires:new{ path = "histoires.koplugin", ui = {
    document = {},
    menu = { registerToMainMenu = function() end },
    switchDocument = function(_, chemin) change = chemin end,
} }
dans_lecteur:ouvrirCommeLivre({ titre = "Un essai", paragraphes = { "Bonjour." } })
verifier(change and change:find("un%-essai%.html$"), "le lecteur ne change pas de document")
verifier(#montres == 0, "un second lecteur a été ouvert par-dessus le premier")

-- Lancement depuis NickelMenu.
io.open("/tmp/histoires-kobo.ouvrir", "w"):close()
montres = {}
Histoires:new{ path = "histoires.koplugin", ui = { menu = { registerToMainMenu = function() end } } }
verifier(dernier() and dernier()._type == "ButtonDialog", "l'accueil ne s'ouvre pas au lancement depuis NickelMenu")
verifier(not io.open("/tmp/histoires-kobo.ouvrir"), "le fichier d'ouverture n'est pas supprimé")

os.execute("rm -rf " .. donnees)
print(string.format("Interface : %d échec(s).", echecs))
os.exit(echecs == 0 and 0 or 1)
