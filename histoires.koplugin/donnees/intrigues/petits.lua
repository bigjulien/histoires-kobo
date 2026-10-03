-- Intrigues courtes et répétitives pour les tout-petits (2 et 3 ans).
-- Voir amitie.lua pour les règles d'écriture.

return {
    intrigues = {
        {
            id = "grand_petit",
            titre = { "Grand ou petit ?" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "apprendre" },
            paragraphes = {
                "{^heros.nom} rencontre un éléphant. Qu'il est grand ! Puis une fourmi. Qu'elle est petite !",
                "{^heros.nom} rencontre un escargot. Qu'il est lent ! Puis un lièvre. Qu'il est rapide !",
                "{^heros.nom} rencontre un hippopotame. Qu'il est lourd ! Puis une plume qui vole. Qu'elle est légère !",
                "Et {heros.nom} ? {^heros|Il|Elle} n'est ni trop grand{heros||e}, ni trop petit{heros||e}. {^heros|Il|Elle} est juste comme il faut !",
            },
        },
        {
            id = "calins",
            titre = { "Les câlins", "{heros.nom} fait des câlins" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "tendresse" },
            paragraphes = {
                "Aujourd'hui, {heros.nom} a envie de faire des câlins.",
                "Un câlin à {compagnon.nom}, {compagnon.un} {compagnon.detail}. Tout doux !",
                "Un câlin au grand arbre. Tout rugueux ! Un câlin au petit mouton. Tout frisé ! Un câlin au gros caillou. Tout froid ! Brrr.",
                "Et le plus beau câlin de tous ? C'est celui de maman, bien sûr. Tout chaud, tout doux, tout plein d'amour.",
            },
        },
        {
            id = "la_puree",
            titre = { "Une cuillère pour…" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "repas" },
            paragraphes = {
                "{^heros.nom} a faim. Qu'est-ce qu'il y a dans l'assiette ? De la purée !",
                "Une cuillère pour le chat. Une cuillère pour le chien. Une cuillère pour le petit oiseau. Une cuillère pour le gros ours.",
                "Et la dernière cuillère ? Pour {heros.nom}, bien sûr ! Miam ! L'assiette est toute vide.",
                "{^heros.nom} a le ventre tout rond, et de la purée jusqu'aux oreilles.",
            },
        },
        {
            id = "les_traces",
            titre = { "À qui sont ces traces ?" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "apprendre", "animaux" },
            paragraphes = {
                "Par terre, {heros.nom} trouve des traces. À qui sont-elles ?",
                "De toutes petites traces en étoile ? Ce sont les pattes d'un oiseau ! Des traces rondes avec quatre petits coussinets ? C'est le chat !",
                "Une longue trace qui brille ? C'est l'escargot ! De grosses traces de bottes ? C'est le jardinier !",
                "Et ces traces-là, juste derrière ? Regarde bien… Ce sont les tiennes, {heros.nom} !",
            },
        },
        {
            id = "bonjour_matin",
            titre = { "Bonjour, tout le monde !" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "routine" },
            paragraphes = {
                "{^heros.nom} se réveille et dit bonjour à tout le monde.",
                "« Bonjour, le soleil ! » Le soleil fait briller ses rayons. « Bonjour, les oiseaux ! » Les oiseaux chantent : cui-cui !",
                "« Bonjour, les fleurs ! » Les fleurs ouvrent leurs pétales. « Bonjour, {compagnon.nom} ! » {^compagnon.nom}, {compagnon.un} {compagnon.detail}, fait un grand signe de la main.",
                "Quelle belle journée pour jouer !",
            },
        },
        {
            id = "petit_train",
            titre = { "Le petit train", "Tchou, tchou !" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "compter" },
            paragraphes = {
                "{^heros.nom} conduit un petit train. Tchou, tchou !",
                "Premier arrêt : un chat monte dans le train. Miaou ! Ça fait un passager.",
                "Deuxième arrêt : un chien monte. Ouaf ! Ça fait deux passagers.",
                "Troisième arrêt : une poule monte. Cot, cot ! Ça fait trois passagers.",
                "Dernier arrêt : tout le monde descend ! « Merci, {heros.nom} ! » Le petit train a bien travaillé.",
            },
        },
        {
            id = "bulles_de_savon",
            titre = { "Les bulles de savon" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "jeu" },
            paragraphes = {
                "{^heros.nom} souffle dans le petit anneau. Fffff… Une bulle ! Elle brille de toutes les couleurs.",
                "Fffff… Deux bulles ! Fffff… Trois bulles ! Elles volent, elles dansent, elles montent.",
                "Pop ! Une bulle éclate. Pop ! Encore une. Pop, pop, pop !",
                "Et la plus grosse bulle ? Elle monte, monte, jusqu'au ciel. Au revoir, la bulle !",
            },
        },
        {
            id = "ou_dorment_les_animaux",
            titre = { "Où dorment les animaux ?" },
            age_min = 2, age_max = 3, moment = "soir", themes = { "animaux", "coucher" },
            paragraphes = {
                "C'est bientôt l'heure de dormir. Mais où dorment les animaux ?",
                "Où dort l'oiseau ? Dans son nid, tout en haut de l'arbre. Où dort le poisson ? Dans l'eau, les yeux ouverts !",
                "Où dort la chauve-souris ? Accrochée, la tête en bas ! Où dort le cheval ? Debout, dans son écurie.",
                "Et {heros.nom}, où dort-{heros|il|elle} ? Dans {lieu.lit}, {heros|tout blotti|toute blottie}.",
            },
        },
        {
            id = "les_bisous",
            titre = { "La tournée des bisous" },
            age_min = 2, age_max = 3, moment = "soir", themes = { "coucher", "tendresse" },
            paragraphes = {
                "Avant de dormir, {heros.nom} fait la tournée des bisous.",
                "Un bisou à papa. Smack ! Un bisou à maman. Smack !",
                "Un bisou au nounours. Smack ! Un bisou au petit poisson rouge, à travers son bocal. Smack !",
                "Et le dernier bisou ? Il est pour toi, {enfant}. Smack !",
            },
        },
    },
}
