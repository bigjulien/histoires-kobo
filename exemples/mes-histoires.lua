-- Modèle pour ajouter vos propres histoires, personnages ou lieux.
--
-- Copiez ce fichier dans le dossier « histoires » de KOReader sur la liseuse :
--   /mnt/onboard/.adds/koreader/histoires/mes-histoires.lua
-- puis choisissez « Recharger la base » dans les réglages du plugin.
--
-- Toutes les sections sont facultatives. Une entrée qui reprend l'id d'une
-- entrée existante la remplace. Les champs à remplir sont décrits dans les
-- fichiers du dossier histoires.koplugin/donnees/.
return {
    personnages = {
        { id = "pingouin", nom = "Tobi", un = "un petit pingouin", le = "le petit pingouin", genre = "m",
          detail = "qui marche en se dandinant", aime = "glisser sur la glace",
          depasse = "un petit bec orange", maison = "son igloo", gouter = "deux petits poissons" },
    },

    lieux = {
        { id = "banquise", nom = "la banquise", dans = "sur la banquise", de = "de la banquise",
          detail = "où tout est blanc et brillant", son = "la glace fait cric, crac",
          cachette = "derrière un bloc de glace", lit = "un petit lit de neige toute douce",
          tresor = "un flocon qui ne fond jamais" },
    },

    histoires = {
        {
            id = "ma_premiere_histoire",
            titre = "Le câlin du soir",
            age_min = 2, age_max = 5,
            paragraphes = {
                "Ce soir, {enfant} fait un grand câlin à {doudou}.",
                "Et {doudou} fait un grand câlin à {enfant}.",
                "Bonne nuit !",
            },
        },
    },

    trames = {
        {
            id = "glissade",
            titre = "{heros.nom} fait du toboggan",
            age_min = 2, age_max = 4,
            choix = { cris = { "Youpi !", "Wouhou !", "Encore !" } },
            paragraphes = {
                "{^heros.nom} grimpe tout en haut du toboggan {lieu.dans}.",
                "Et hop, {heros|il|elle} glisse jusqu'en bas. « {cris#1} »",
                "{^compagnon.nom} glisse à son tour. « {cris#2} »",
            },
        },
    },
}
