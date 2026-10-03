-- Intrigues du soir, pour s'endormir. Voir amitie.lua pour les règles
-- d'écriture.

return {
    intrigues = {
        {
            id = "compter_moutons",
            titre = { "Les moutons qui ne sautent pas" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "coucher", "humour" },
            paragraphes = {
                "Ce soir, {heros.nom} n'arrive pas à dormir. {^heros|Il|Elle} se tourne à gauche, se tourne à droite. Rien à faire !",
                "« Compte les moutons », dit {compagnon.nom}, {compagnon.un} {compagnon.detail}, en bâillant.",
                "Alors {heros.nom} ferme les yeux et imagine une petite barrière. Un mouton saute : hop ! Un. Un deuxième mouton : hop ! Deux. Un troisième, tout frisé : hop ! Trois.",
                "Le quatrième mouton, lui, ne saute pas. Il s'assoit devant la barrière, bâille un grand coup, et s'endort. « Hé ! Et moi, alors ? » dit le cinquième mouton. Puis il bâille aussi…",
                "Bientôt, tous les moutons dorment en tas, comme un gros nuage de laine. Et {heros.nom} bâille à son tour…",
            },
        },
        {
            id = "marchand_de_sable",
            titre = { "Le marchand de sable" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "coucher" },
            paragraphes = {
                "Ce soir, quand tout devient calme, un tout petit bonhomme arrive sur la pointe des pieds. Il porte un grand sac sur son dos. C'est le marchand de sable !",
                "Il passe chez les lapins, chez les écureuils, chez les petits oiseaux. Pfffit, pfffit ! Une pincée de sable doré sur chaque paupière.",
                "Puis, sans faire de bruit, il arrive tout près de l'endroit où {heros.nom} attend le sommeil. Pfffit ! Les paupières deviennent lourdes, lourdes…",
                "Le marchand de sable sourit et repart, son sac sur le dos. Il a encore beaucoup d'enfants à endormir cette nuit.",
            },
        },
        {
            id = "bruits_de_la_maison",
            titre = { "Les bruits de la nuit", "La maison qui dit bonne nuit" },
            age_min = 2, age_max = 4, moment = "soir", themes = { "coucher", "peur" },
            paragraphes = {
                "La nuit, tout fait de drôles de petits bruits. Écoute bien…",
                "Tic, tac, tic, tac… C'est la vieille horloge qui compte les minutes. Crac… C'est le plancher qui s'étire, comme quand on bâille.",
                "Plic… plic… C'est une goutte d'eau qui tombe du robinet. Hou, hou… C'est le vent qui chante dans la cheminée.",
                "{^heros.nom} écoute tous ces petits bruits. Ils ne font pas peur. C'est juste la maison qui dit bonne nuit.",
            },
        },
        {
            id = "long_dodo",
            titre = { "À bientôt, au printemps !" },
            age_min = 4, age_max = 5, moment = "soir", themes = { "saisons", "amitie" },
            paragraphes = {
                "Les jours raccourcissent, et il fait de plus en plus froid. {^compagnon.nom}, {compagnon.un} {compagnon.detail}, bâille sans arrêt.",
                "« Je vais faire un très long dodo, dit {compagnon.nom}. Tout l'hiver ! On se reverra au printemps. »",
                "{^heros.nom} est un peu triste : tout l'hiver, c'est long ! Alors {heros|il|elle} aide {compagnon.nom} à préparer un lit bien moelleux, avec des feuilles et de la mousse.",
                "« Bonne nuit, et à très vite ! » {^compagnon.nom} ferme les yeux et s'endort en souriant.",
                "Tout l'hiver, {heros.nom} pensera à {compagnon.nom}. Et au premier rayon de soleil du printemps, {heros|il|elle} viendra frapper doucement : toc, toc, c'est le printemps !",
            },
        },
        {
            id = "berceuse_des_etoiles",
            titre = { "La berceuse des étoiles" },
            age_min = 2, age_max = 4, moment = "soir", themes = { "coucher", "musique" },
            paragraphes = {
                "Ce soir, {heros.nom} regarde le ciel. Les étoiles clignotent, toutes ensemble, comme si elles chantaient.",
                "La première étoile chante : « Dodo, dodo… » La deuxième répond : « Ferme les yeux… » La troisième murmure : « Fais de beaux rêves… »",
                "Bientôt, tout le ciel chante une berceuse si douce que les arbres arrêtent de bouger et que le vent retient son souffle.",
                "{^heros.nom} écoute, écoute… et la musique des étoiles {heros|le|la} berce tout doucement.",
            },
        },
        {
            id = "lampe_magique",
            titre = { "Les ombres chinoises" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "jeu", "peur" },
            choix = { ombres = { "un lapin aux grandes oreilles", "un oiseau qui bat des ailes", "un loup qui ouvre la bouche",
                                 "un escargot qui avance", "un canard qui fait coin-coin" } },
            paragraphes = {
                "Ce soir, {compagnon.nom}, {compagnon.un} {compagnon.detail}, allume une petite lampe et la pose contre le mur. « Regarde ce que je sais faire ! »",
                "{^compagnon.nom} plie les doigts devant la lumière, et sur le mur apparaît… {ombres#1} ! {^heros.nom} applaudit.",
                "« À moi ! » {^heros.nom} essaie à son tour, et sur le mur apparaît… {ombres#2} ! Enfin, quelque chose qui y ressemble un peu.",
                "{^duo|Ils|Elles} inventent toute une histoire avec leurs ombres, jusqu'à ce que les mains soient trop fatiguées pour bouger. Les ombres, c'est juste de la lumière qui joue.",
            },
        },
    },
}
