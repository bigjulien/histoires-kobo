-- Intrigues d'aventure et d'imagination. Voir amitie.lua pour les règles
-- d'écriture.

return {
    intrigues = {
        {
            id = "carte_au_tresor",
            titre = { "La carte au trésor" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "aventure" },
            choix = {
                etapes = {
                    { dessin = "un arbre tordu", texte = "Voilà l'arbre tordu, avec ses branches comme de grands bras !" },
                    { dessin = "un rocher en forme de tortue", texte = "Voilà le rocher en forme de tortue. On dirait qu'il dort !" },
                    { dessin = "un petit pont de bois", texte = "Voilà le petit pont de bois, qui fait cric, crac sous les pas." },
                    { dessin = "trois cailloux blancs", texte = "Voilà les trois cailloux blancs, bien alignés." },
                    { dessin = "une cascade", texte = "Voilà la cascade, qui chante en éclaboussant tout autour." },
                },
                coffre = {
                    "des billes de toutes les couleurs, qui brillent comme des pierres précieuses",
                    "une vieille boussole et un petit mot : « Le vrai trésor, c'est l'aventure ! »",
                    "des pièces en chocolat, juste assez pour chacun",
                    "un sachet de graines de fleurs, avec écrit dessus : « fleurs magiques »",
                },
            },
            paragraphes = {
                "En se promenant, {heros.nom} trouve une vieille bouteille. Dedans, il y a un papier tout roulé. C'est une carte au trésor !",
                "Sur la carte, il y a des dessins : {etapes#1.dessin}, puis {etapes#2.dessin}, et une grande croix rouge.",
                "{^heros.nom} appelle {compagnon.nom}, {compagnon.un} {compagnon.detail}. « Viens ! On part à l'aventure ! »",
                "{^duo|Ils|Elles} marchent longtemps. {etapes#1.texte} Puis {duo|ils|elles} marchent encore. {etapes#2.texte} Et juste derrière… la grande croix rouge !",
                "{^duo|Ils|Elles} creusent, creusent… Toc ! Un petit coffre en bois ! Dedans, il y a {coffre}.",
                "« On est riches ! » crie {heros.nom}. Sur le chemin du retour, {duo|ils|elles} se promettent de cacher à leur tour un trésor, pour les prochains aventuriers.",
            },
        },
        {
            id = "bateaux_ecorce",
            titre = { "La course des petits bateaux" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "jeu", "amitie" },
            paragraphes = {
                "{^heros.nom} et {compagnon.nom}, {compagnon.un} {compagnon.detail}, fabriquent des petits bateaux : un morceau d'écorce, un bâton pour le mât, une feuille pour la voile.",
                "« Un, deux, trois, partez ! » Les deux bateaux glissent sur le ruisseau. Le bateau à la voile rouge prend de l'avance ! Mais le bateau à la voile verte le rattrape !",
                "Oh non ! Le bateau rouge se coince dans les herbes. {^heros.nom} le dégage avec un bâton, tout doucement. Et c'est reparti !",
                "Les deux bateaux arrivent en même temps près du gros caillou. Égalité ! « Les deux ont gagné ! » Et {duo|ils|elles} repartent pour une nouvelle course.",
            },
        },
        {
            id = "grotte_cristaux",
            titre = { "La grotte qui brille" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "aventure" },
            paragraphes = {
                "{^heros.nom} découvre l'entrée d'une grotte. Il fait tout noir, là-dedans. « Il y a quelqu'un ? » « …quelqu'un… quelqu'un… » répond l'écho.",
                "{^heros|Il|Elle} appelle {compagnon.nom}, {compagnon.un} {compagnon.detail}, qui arrive avec une lanterne. {^duo|Ils|Elles} entrent à petits pas.",
                "Les murs de la grotte brillent ! Partout, des cristaux scintillent comme des étoiles quand la lumière les touche.",
                "Tout au fond, {duo|ils|elles} trouvent une famille de chauves-souris, suspendues la tête en bas, qui dorment. Chut ! Il ne faut pas les réveiller.",
                "Sur la pointe des pieds, {duo|ils|elles} ressortent. Dehors, le soleil les éblouit. « Quelle aventure ! » chuchote {heros.nom}, comme si les chauves-souris pouvaient encore l'entendre.",
            },
        },
        {
            id = "montgolfiere",
            titre = { "Le tour en montgolfière" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "aventure" },
            paragraphes = {
                "Un grand ballon multicolore se pose tout près. Dans la nacelle, un vieux monsieur moustachu fait signe. « Vous voulez faire un tour ? »",
                "{^heros.nom} grimpe dans la nacelle avec {compagnon.nom}, {compagnon.un} {compagnon.detail}. Le monsieur tire une ficelle, et fffff… la montgolfière s'élève dans le ciel.",
                "Vu d'en haut, tout est tout petit ! Les maisons ressemblent à des jouets, les rivières à des rubans, et les arbres à des brocolis.",
                "{^heros.nom} fait coucou à un oiseau qui vole à côté. L'oiseau a l'air très surpris de voir {heros.le} si haut.",
                "Puis la montgolfière redescend tout doucement. « Merci, monsieur ! » {^heros.nom} a la tête pleine de nuages et le cœur plein de joie.",
            },
        },
        {
            id = "pirates",
            titre = { "À l'abordage !", "Les pirates" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "jeu", "imagination" },
            paragraphes = {
                "Aujourd'hui, {heros.nom} et {compagnon.nom}, {compagnon.un} {compagnon.detail}, jouent aux pirates ! Un grand carton devient un bateau, un balai devient un mât, et un torchon devient le drapeau.",
                "« Capitaine {heros.nom}, terre à l'horizon ! » crie {compagnon.nom}, avec une longue-vue en rouleau de papier.",
                "Mais attention ! Une tempête arrive ! Le bateau tangue à gauche, à droite… {^duo|Ils|Elles} se cramponnent en criant : « Ohé ! Ohé ! »",
                "La tempête passe. Le bateau accoste sur l'île mystérieuse, qui ressemble beaucoup à un gros coussin. Et sur l'île, il y a un trésor : le goûter !",
                "« À l'abordage ! » Et les deux pirates dévorent leur trésor jusqu'à la dernière miette.",
            },
        },
        {
            id = "cle_doree",
            titre = { "La petite clé dorée" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "aventure", "imagination" },
            choix = { portes = { "la porte du vieux cabanon", "la boîte aux lettres", "le coffre du grenier", "la porte du poulailler" } },
            paragraphes = {
                "Par terre, quelque chose brille. C'est une petite clé dorée ! « Qu'est-ce qu'elle peut bien ouvrir ? » se demande {heros.nom}.",
                "{^heros|Il|Elle} essaie la clé sur {portes#1}. Elle ne rentre pas. Sur {portes#2} ? Elle ne tourne pas.",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, montre quelque chose du doigt. Au pied d'un grand arbre, il y a une toute petite porte ronde, à peine plus grande qu'un livre.",
                "La clé tourne : clic ! La petite porte s'ouvre. À l'intérieur, une souris en tablier leur sourit. « Enfin ! J'avais perdu ma clé ! Entrez donc prendre le thé ! »",
                "Ce jour-là, {heros.nom} et {compagnon.nom} ont bu le plus petit thé du monde, dans les plus petites tasses du monde. Et c'était délicieux.",
            },
        },
        {
            id = "le_sommet",
            titre = { "Tout en haut de la colline" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "perseverance", "aventure" },
            paragraphes = {
                "« Un jour, je monterai tout en haut de la grande colline », répète souvent {heros.nom}. Et aujourd'hui, c'est le grand jour !",
                "{^heros.nom} part avec {compagnon.nom}, {compagnon.un} {compagnon.detail}. Le chemin monte, monte, monte. Les jambes deviennent lourdes… « Je suis {heros|fatigué|fatiguée}… On arrête ? »",
                "« Encore un petit effort, dit {compagnon.nom}. On compte nos pas jusqu'à vingt, et on fait une pause. » Un, deux, trois… vingt. Pause. Une gorgée d'eau. Et on repart.",
                "Et enfin… le sommet ! De là-haut, on voit tout : les champs, la rivière, les toits des maisons, et même la mer, toute bleue, au loin.",
                "{^heros.nom} ouvre grand les bras et crie : « J'ai réussi ! » Et l'écho répond : « …ussi… ussi… »",
            },
        },
        {
            id = "voyage_nuage",
            titre = { "Le voyage en nuage" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "reve", "imagination" },
            paragraphes = {
                "Cette nuit, un petit nuage vient frapper à la fenêtre : toc, toc. « Tu viens faire un tour ? »",
                "{^heros.nom} grimpe sur le nuage. C'est doux comme de la barbe à papa ! Et hop, ils s'envolent au-dessus des toits.",
                "Ils passent près de la lune, qui fait coucou. Ils glissent entre les étoiles, qui chantent tout bas. Ils survolent la mer, où les baleines dorment en ronflant.",
                "Puis le nuage ramène {heros.nom} tout doucement, et {heros|le|la} dépose au chaud.",
                "Était-ce un rêve ? Peut-être. Mais sur l'oreiller, il reste un petit bout de nuage, tout blanc et tout doux.",
            },
        },
    },
}
