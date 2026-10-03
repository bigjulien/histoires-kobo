-- Intrigues sur l'amitié.
--
-- Une intrigue est le cœur d'une histoire composée : le générateur la place
-- entre un début (donnees/ouvertures.lua) et une fin (donnees/fins.lua).
-- Le début a déjà présenté le héros et le lieu. Si l'intrigue fait
-- intervenir le compagnon, elle le présente la première fois :
-- « {compagnon.nom}, {compagnon.un} {compagnon.detail} ».
-- moment : "jour" ou "soir", pour choisir un début et une fin qui collent.
-- lieux (facultatif) : liste des lieux où l'intrigue a du sens.

local JEUX = { "à saute-mouton", "à la marelle", "au ballon", "à chat perché", "à la ronde", "à cache-cache" }
local CADEAUX = { "une plume toute légère", "une jolie feuille en forme de cœur", "un caillou tout doux",
                  "une petite fleur bleue", "un brin de laine rouge" }

return {
    intrigues = {
        {
            id = "nouveau_voisin",
            titre = { "Le nouveau venu", "{heros.nom} se fait un ami" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "amitie" },
            choix = { jeux = JEUX },
            paragraphes = {
                "Ce jour-là, {heros.nom} remarque quelqu'un de nouveau, tout seul dans son coin. C'est {compagnon.nom}, {compagnon.un} {compagnon.detail}, qui vient d'arriver.",
                "{^compagnon.nom} regarde ses pieds. {^compagnon|Il|Elle} n'ose dire bonjour à personne.",
                "{^heros.nom} s'approche doucement. « Bonjour ! Je m'appelle {heros.nom}. Tu veux jouer avec moi ? »",
                "{^compagnon.nom} relève la tête. Un petit sourire apparaît. « Oh oui ! Mais je ne connais personne ici… » « Maintenant, tu me connais, moi ! » répond {heros.nom}.",
                "Alors {heros.nom} fait visiter tous les coins secrets : {lieu.cachette}, l'endroit où l'on trouve {lieu.tresor}, et le meilleur endroit pour jouer {jeux}.",
                "À la fin de la journée, {compagnon.nom} n'a plus du tout l'air timide. « {compagnon|Je suis content d'être arrivé ici|Je suis contente d'être arrivée ici} ! » Parfois, il suffit d'un bonjour pour se faire un ami.",
            },
        },
        {
            id = "chacun_son_tour",
            titre = { "Chacun son tour", "La balançoire" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "amitie", "partage" },
            paragraphes = {
                "Aujourd'hui, {heros.nom} joue avec {compagnon.nom}, {compagnon.un} {compagnon.detail}. Mais il n'y a qu'une seule balançoire, et {duo|tous les deux|toutes les deux} veulent monter dessus !",
                "« C'est moi d'abord ! » crie {heros.nom}. « Non, c'est moi ! » crie {compagnon.nom}. {^duo|Ils|Elles} se fâchent tout rouge.",
                "Grand-mère Tortue, qui passait par là, s'arrête. « Pourquoi ne pas jouer chacun votre tour ? Comptez jusqu'à dix, et on échange. »",
                "{^heros.nom} monte en premier. Un, deux, trois… dix ! « À toi, {compagnon.nom} ! » Un, deux, trois… dix ! Et on recommence.",
                "Puis {compagnon.nom} a une idée : « Et si je te poussais ? » Oh, que c'est bien ! Pousser, c'est presque aussi drôle que se balancer.",
                "À force de rire, {duo|ils|elles} oublient leur dispute. Chacun son tour, c'est plus juste, et c'est même plus amusant.",
            },
        },
        {
            id = "ami_enrhume",
            titre = { "Atchoum !", "Un ami tout enrhumé" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "amitie" },
            choix = { cadeaux = CADEAUX },
            paragraphes = {
                "Aujourd'hui, {heros.nom} va chercher {compagnon.nom}, {compagnon.un} {compagnon.detail}, pour jouer. Mais {compagnon.nom} est au lit, avec le nez tout rouge. Atchoum !",
                "« J'ai attrapé un rhume, dit {compagnon.nom} tristement. Je ne peux pas sortir aujourd'hui. »",
                "{^heros.nom} réfléchit. Comment {compagnon|le|la} consoler ? {^heros|Il|Elle} file dehors et rapporte {lieu.tresor}, {cadeaux#1} et {cadeaux#2}.",
                "Puis {heros.nom} s'assoit près du lit et raconte une histoire, avec des grosses voix et des petites voix. {^compagnon.nom} rit si fort qu'{compagnon|il|elle} en oublie de tousser.",
                "Quelques jours plus tard, {compagnon.nom} est complètement {compagnon|guéri|guérie}. Et devine qui {compagnon|il|elle} vient voir en premier ? {^heros.nom}, bien sûr !",
            },
        },
        {
            id = "pique_nique",
            titre = { "Le pique-nique", "{heros.nom} pique-nique" },
            age_min = 2, age_max = 5, moment = "jour", themes = { "amitie", "partage" },
            choix = {
                nuages = { "un gros gâteau", "un mouton qui saute", "un bateau à voiles", "une baleine",
                           "un lapin qui dort", "une chaussette géante" },
            },
            paragraphes = {
                "Aujourd'hui, c'est le jour du pique-nique ! {^heros.nom} prépare son panier avec {heros.gouter}.",
                "{^heros|Il|Elle} retrouve {compagnon.nom}, {compagnon.un} {compagnon.detail}, qui a apporté {compagnon.gouter}.",
                "{^duo|Ils|Elles} étalent une grande nappe à carreaux. Mais oh ! Une fourmi arrive. Puis deux. Puis dix fourmis ! « Elles ont faim, elles aussi », dit {heros.nom}. Alors on pose une miette pour les fourmis, juste là, au bord de la nappe.",
                "{^heros.nom} goûte {compagnon.gouter}, et {compagnon.nom} goûte {heros.gouter}. « Miam ! Partager, c'est encore meilleur ! »",
                "Le ventre bien rond, {duo|ils|elles} s'allongent et regardent les nuages passer. Celui-là ressemble à {nuages#1}, et celui-ci à {nuages#2}.",
            },
        },
        {
            id = "cabane_secrete",
            titre = { "La cabane secrète" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "amitie", "perseverance" },
            choix = { motdepasse = { "Patate volante", "Chaussette à moustache", "Gâteau qui chante", "Crocodile en pyjama" } },
            paragraphes = {
                "{^heros.nom} et {compagnon.nom}, {compagnon.un} {compagnon.detail}, ont un grand projet : construire une cabane secrète.",
                "{^heros.nom} apporte des branches. {^compagnon.nom} apporte des feuilles. {^duo|Ils|Elles} empilent, attachent, ajustent… Mais patatras ! Tout s'écroule.",
                "« On n'y arrivera jamais », soupire {heros.nom}. « Mais si, dit {compagnon.nom}. On recommence, en mettant les grosses branches en bas. »",
                "Cette fois, la cabane tient debout ! Il y a même une petite fenêtre, et un rideau de feuilles en guise de porte.",
                "{^duo|Ils|Elles} inventent un mot de passe que seuls les vrais amis connaissent : « {motdepasse} ! » Chut, c'est un secret.",
            },
        },
        {
            id = "la_course",
            titre = { "La grande course" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "amitie", "entraide" },
            paragraphes = {
                "Ce jour-là, tous les animaux {lieu.de} organisent une grande course. {^heros.nom} et {compagnon.nom}, {compagnon.un} {compagnon.detail}, sont sur la ligne de départ.",
                "« À vos marques… Prêts… Partez ! » {^heros.nom} court, court, court. {^heros|Il|Elle} est en tête !",
                "Mais derrière, {compagnon.nom} trébuche sur un caillou et tombe. Aïe !",
                "{^heros.nom} s'arrête. Gagner, c'est bien. Mais un ami qui a mal, c'est plus important. {^heros|Il|Elle} fait demi-tour et aide {compagnon.nom} à se relever.",
                "Les autres sont déjà loin. Alors {duo|ils|elles} finissent la course ensemble, bras dessus, bras dessous, et arrivent {duo|les derniers|les dernières}.",
                "Pourtant, tout le monde les applaudit plus fort que le gagnant. Ce jour-là, {heros.nom} a gagné quelque chose de bien plus précieux qu'une course.",
            },
        },
        {
            id = "grand_et_petit",
            titre = { "À deux, on sait tout faire" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "amitie", "entraide" },
            choix = { fruits = { "une belle pomme rouge", "une poire bien dorée", "une grosse cerise", "une prune violette" } },
            paragraphes = {
                "{^heros.nom} se promène avec {compagnon.nom}, {compagnon.un} {compagnon.detail}. Tout en haut d'un arbre pend {fruits}.",
                "{^heros.nom} saute, saute, saute… Trop haut ! Alors {compagnon.nom} grimpe sur une grosse pierre, tend le bras, et hop ! {^compagnon|Il|Elle} attrape le fruit.",
                "Un peu plus loin, {duo|ils|elles} entendent un petit miaulement. Un chaton est coincé dans un tronc creux, et le trou est tout petit !",
                "{^compagnon.nom} essaie de passer la tête. Trop étroit ! Mais {heros.nom} se fait tout petit, se faufile dans le trou, et ressort avec le chaton dans les bras.",
                "« Tu vois, dit {compagnon.nom}, à deux, on sait tout faire ! » Et {duo|ils|elles} partagent le fruit, moitié-moitié.",
            },
        },
        {
            id = "le_pot_casse",
            titre = { "Le pot fêlé", "Le caillou dans le ventre" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "verite", "amitie" },
            paragraphes = {
                "{^heros.nom} joue chez {compagnon.nom}, {compagnon.un} {compagnon.detail}. Sur une étagère, il y a un joli pot en terre, {compagnon|qu'il a fabriqué lui-même|qu'elle a fabriqué elle-même}.",
                "{^heros.nom} le prend pour le regarder de plus près… et oups ! Le pot tombe. Crac ! Une grosse fissure apparaît.",
                "Vite, {heros.nom} repose le pot, la fissure tournée vers le mur. Personne n'a rien vu. Mais dans son ventre, ça fait comme un gros caillou tout lourd.",
                "Le caillou ne part pas. Il est là pendant le goûter, et encore là pendant le jeu. Alors {heros.nom} prend une grande inspiration : « J'ai cassé ton pot. {heros|Je suis désolé|Je suis désolée}. »",
                "{^compagnon.nom} regarde la fissure, puis {heros.nom}. « Merci de me l'avoir dit. Viens, on va le réparer ensemble. »",
                "Avec un peu de colle et beaucoup de patience, le pot est presque comme neuf. Et le gros caillou dans le ventre ? Envolé ! Dire la vérité, ça rend le cœur tout léger.",
            },
        },
        {
            id = "ami_perdu",
            titre = { "Le chemin de la maison" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "entraide" },
            choix = {
                indices = { "je vois un grand arbre tout tordu", "il y a un pont tout rouge",
                            "on entend une cascade qui chante", "il y a un moulin qui tourne",
                            "je vois une cabane bleue" },
            },
            paragraphes = {
                "En se promenant, {heros.nom} entend quelqu'un pleurer. C'est {compagnon.nom}, {compagnon.un} {compagnon.detail}. {^compagnon|Il|Elle} s'est {compagnon|perdu|perdue} !",
                "« Je ne sais plus où est {compagnon.maison} », sanglote {compagnon.nom}.",
                "« Ne pleure pas, dit {heros.nom}. Qu'est-ce que tu vois, de chez toi ? » {^compagnon.nom} réfléchit. « {^indices#1}, et {indices#2}. »",
                "Alors {duo|ils|elles} partent ensemble. {^duo|Ils|Elles} marchent, marchent, en ouvrant grand les yeux et les oreilles. Et soudain : « Là ! C'est là ! »",
                "{^compagnon.nom} reconnaît {compagnon.maison}. Sur le pas de la porte, sa maman l'attend, les bras grands ouverts.",
                "« Merci ! » dit {compagnon.nom} en serrant {heros.nom} très fort. Depuis ce jour, {duo|ils|elles} sont {duo|les meilleurs amis|les meilleures amies} du monde.",
            },
        },
        {
            id = "la_fanfare",
            titre = { "La fanfare", "{heros.nom} chante" },
            age_min = 2, age_max = 4, moment = "jour", themes = { "musique", "amitie" },
            choix = {
                musiciens = {
                    "un oiseau arrive en sifflant : cui-cui !",
                    "une grenouille arrive en chantant : croâ, croâ !",
                    "un grillon arrive avec son petit violon : cri-cri !",
                    "un canard arrive en soufflant dans une trompette : coin-coin !",
                    "une abeille arrive en bourdonnant : bzz, bzz !",
                },
            },
            paragraphes = {
                "{^heros.nom} se promène en chantant : « La, la, la ! »",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, l'entend et arrive en tapant sur un tambour : boum, boum !",
                "Puis {musiciens#1}",
                "Et puis {musiciens#2}",
                "Tous ensemble, ils font un drôle de concert. Ça fait du bruit, ça fait rire, et ça fait danser tout le monde !",
                "Toute seule, une chanson, c'est joli. Mais avec des amis, c'est une fête !",
            },
        },
        {
            id = "chemin_de_pierres",
            titre = { "Le chemin de pierres" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "entraide", "aventure" },
            paragraphes = {
                "{^heros.nom} et {compagnon.nom}, {compagnon.un} {compagnon.detail}, veulent cueillir des mûres de l'autre côté du ruisseau. Mais le ruisseau est trop large pour sauter !",
                "« Construisons un pont ! » dit {heros.nom}. {^duo|Ils|Elles} poussent une grosse branche… trop courte. Plouf ! Elle tombe dans l'eau.",
                "Alors {compagnon.nom} a une idée : des pierres plates, posées l'une après l'autre. Une pierre, deux pierres, trois pierres… Voilà un chemin !",
                "{^duo|Ils|Elles} traversent en sautillant. Hop, hop, hop ! De l'autre côté !",
                "Les mûres sont délicieuses. {^duo|Ils|Elles} en mangent tant qu'{duo|ils|elles} finissent avec le bout du nez tout violet.",
            },
        },
        {
            id = "fete_surprise",
            titre = { "Surprise !", "La fête surprise" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "amitie" },
            paragraphes = {
                "Aujourd'hui, {heros.nom} veut jouer, mais tout le monde est occupé. Même {compagnon.nom}, {compagnon.un} {compagnon.detail}, répond : « Pas maintenant, je suis très {compagnon|pressé|pressée} ! »",
                "Les autres chuchotent et cachent des choses mystérieuses derrière leur dos. {^heros.nom} se sent {heros|tout seul|toute seule}. {^heros|Il|Elle} s'assoit {lieu.cachette} et soupire.",
                "Soudain, {compagnon.nom} arrive en courant. « Viens vite ! Ferme les yeux ! » Et {compagnon|il|elle} emmène {heros.nom} par la main.",
                "« Tu peux ouvrir ! » SURPRISE ! Tous les amis sont là, avec des guirlandes, des ballons et un énorme gâteau, sur lequel est écrit : « Merci, {heros.nom} ! »",
                "« Mais pourquoi ? » demande {heros.nom}, {heros|tout ému|tout émue}. « Juste parce qu'on t'aime ! » répond {compagnon.nom}. Et la fête dure jusqu'au soir.",
            },
        },
    },
}
