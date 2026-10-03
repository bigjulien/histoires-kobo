-- Intrigues sur la nature, les saisons et les petites bêtes.
-- Voir amitie.lua pour les règles d'écriture.

return {
    intrigues = {
        {
            id = "graine",
            titre = { "La petite graine", "{heros.nom} jardinier" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "nature", "patience" },
            paragraphes = {
                "Ce matin, {heros.nom} trouve une petite graine toute ronde. « Qu'est-ce qui va pousser là-dedans ? »",
                "{^heros|Il|Elle} creuse un petit trou, pose la graine, la recouvre de terre, et l'arrose : plic, ploc.",
                "Le lendemain, {heros.nom} court voir. Rien. Le surlendemain ? Rien du tout. « Elle ne pousse pas ! »",
                "« Il faut être {heros|patient|patiente} », dit {compagnon.nom}, {compagnon.un} {compagnon.detail}. « Une graine, ça travaille en secret, sous la terre. »",
                "Alors chaque jour, {heros.nom} arrose et attend. Et un matin… une petite pousse verte ! Puis une tige. Puis des feuilles. Et enfin, une fleur immense, jaune comme le soleil : un tournesol !",
                "{^heros.nom} doit lever la tête pour le regarder. Tout ça, avec une seule petite graine !",
            },
        },
        {
            id = "arbre_quatre_saisons",
            titre = { "Mon ami l'arbre", "Les quatre saisons" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "nature", "saisons" },
            paragraphes = {
                "{^heros.nom} a un ami un peu spécial : un grand arbre, juste là, tout près.",
                "Au printemps, l'arbre se couvre de fleurs roses, et {heros.nom} fait la sieste dessous en respirant leur parfum.",
                "En été, l'arbre donne de l'ombre et de belles cerises. {^heros.nom} en mange tellement qu'{heros|il|elle} a le bout du nez tout rouge.",
                "En automne, les feuilles deviennent jaunes, orange et rouges, et tombent en tourbillonnant. {^heros.nom} saute dans les gros tas de feuilles : crouch, crouch !",
                "En hiver, l'arbre est tout nu, et {heros.nom} s'inquiète. « Il est malade ? » « Non, il dort, répond {compagnon.nom}, {compagnon.un} {compagnon.detail}. Il garde ses forces pour le printemps. »",
                "Et au printemps suivant, comme promis, les fleurs roses reviennent. « Bonjour, mon ami l'arbre ! Tu m'as manqué ! »",
            },
        },
        {
            id = "chenille",
            titre = { "La petite chenille", "Le secret de la chenille" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "nature" },
            paragraphes = {
                "Sur une feuille, {heros.nom} découvre une petite chenille verte qui mange, mange, mange. Crounch, crounch !",
                "« Bonjour, petite chenille ! Tu veux jouer ? » Mais la chenille est trop occupée. Elle mange encore, puis elle s'enroule dans un petit sac tout doux, accroché à une branche.",
                "« Elle dort ? » se demande {heros.nom}. Chaque jour, {heros|il|elle} vient voir le petit sac. Il ne bouge pas. Il ne fait pas de bruit.",
                "Et puis un matin, le petit sac s'ouvre… Il en sort un magnifique papillon, avec des ailes de toutes les couleurs !",
                "Le papillon s'envole, revient faire trois petits tours, comme pour dire merci, puis disparaît dans le ciel. « Au revoir, petite chenille ! »",
            },
        },
        {
            id = "premiere_neige",
            titre = { "La première neige" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "nature", "saisons" },
            paragraphes = {
                "Ce matin, quand {heros.nom} ouvre les yeux, tout est blanc dehors. De gros flocons tombent du ciel, doucement, sans bruit. C'est la neige !",
                "{^heros.nom} met son bonnet, son écharpe, et sort en courant. Ses pas font crounch, crounch dans la neige toute fraîche.",
                "{^heros|Il|Elle} tire la langue pour attraper un flocon. C'est froid ! Puis {heros|il|elle} s'allonge par terre et bouge les bras et les jambes : voilà un ange de neige !",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, arrive. Ensemble, {duo|ils|elles} roulent une grosse boule, puis une moyenne, puis une petite. Une carotte pour le nez, deux cailloux pour les yeux… Bonjour, bonhomme de neige !",
                "Les joues toutes rouges, {duo|ils|elles} rentrent boire un grand bol de chocolat chaud. Quelle belle journée blanche !",
            },
        },
        {
            id = "etoile_filante",
            titre = { "L'étoile filante", "Le vœu secret" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "nuit" },
            paragraphes = {
                "Ce soir, {heros.nom} est {heros|allongé|allongée} par terre, le nez en l'air. Le ciel est plein d'étoiles.",
                "Soudain, une étoile file à toute vitesse, avec une longue queue brillante. Fiouuu ! « Une étoile filante ! »",
                "« Vite, fais un vœu ! » chuchote {compagnon.nom}, {compagnon.un} {compagnon.detail}, {compagnon|allongé|allongée} juste à côté.",
                "{^heros.nom} ferme les yeux très fort et fait son vœu, tout bas, dans sa tête. Un vœu, c'est secret : il ne faut le dire à personne.",
                "« Qu'est-ce que tu as souhaité ? » demande {compagnon.nom}. {^heros.nom} sourit. « C'est un secret ! Mais je peux te dire une chose : tu es dedans. »",
            },
        },
        {
            id = "vent_farceur",
            titre = { "Le vent farceur", "Le chapeau envolé" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "nature", "humour" },
            paragraphes = {
                "Aujourd'hui, {heros.nom} porte un beau chapeau de paille. Mais le vent est d'humeur farceuse. Fffouuu ! Il attrape le chapeau et l'emporte !",
                "« Rends-moi mon chapeau ! » {^heros.nom} court derrière. Le chapeau roule sur le chemin, saute par-dessus un buisson, fait la roue comme un acrobate…",
                "Il s'arrête enfin… sur la tête d'un épouvantail ! L'épouvantail a l'air très content de son nouveau chapeau.",
                "{^heros.nom} éclate de rire. « Bon, d'accord, garde-le. Il te va très bien ! » Et le vent, lui aussi, a l'air de rire : hou, hou, hou !",
            },
        },
        {
            id = "coquillage",
            titre = { "La chanson du coquillage" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "nature" },
            lieux = { "plage" },
            paragraphes = {
                "{^heros.nom} trouve un grand coquillage tout en spirale. {^compagnon.nom}, {compagnon.un} {compagnon.detail}, lui dit : « Colle-le contre ton oreille ! »",
                "{^heros.nom} écoute… Chhhh… chhhh… « J'entends la mer ! Elle est cachée là-dedans ? »",
                "« C'est la chanson de la mer, dit {compagnon.nom}. Elle la donne aux coquillages, pour qu'on puisse l'emporter partout. »",
                "Alors {heros.nom} rapporte le coquillage dans {heros.maison}. Et chaque fois qu'{heros|il|elle} a envie d'entendre la mer, {heros|il|elle} n'a qu'à écouter.",
            },
        },
        {
            id = "lucioles",
            titre = { "Les lucioles" },
            age_min = 2, age_max = 4, moment = "soir", themes = { "nature", "nuit" },
            paragraphes = {
                "Ce soir, de toutes petites lumières dansent dans le noir. Une, deux, trois… Ce sont des lucioles !",
                "« Bonsoir, les lucioles ! » dit {heros.nom}. Les lucioles clignotent : allumé, éteint, allumé, éteint. On dirait qu'elles répondent !",
                "{^heros.nom} compte : une, deux, trois, quatre, cinq lucioles. Elles font une ronde lumineuse, juste au-dessus de sa tête.",
                "Puis, une à une, les lucioles s'en vont dormir. La dernière fait un petit clignement, comme un clin d'œil.",
            },
        },
        {
            id = "flaques",
            titre = { "Les flaques", "Splash !" },
            age_min = 2, age_max = 3, moment = "jour", themes = { "nature", "jeu" },
            paragraphes = {
                "Il a plu toute la nuit. Ce matin, il y a des flaques partout !",
                "{^heros.nom} met ses bottes. Une petite flaque : plic ! Une flaque moyenne : ploc ! Une ÉNORME flaque : SPLASH !",
                "{^heros.nom} est {heros|mouillé|mouillée} de la tête aux pieds. Et {heros|il|elle} rit, rit, rit !",
                "Dans la plus grande flaque, {heros|il|elle} voit le ciel tout bleu, et son propre visage qui fait une grimace. Coucou !",
            },
        },
        {
            id = "lune_qui_change",
            titre = { "Qui a mangé la lune ?" },
            age_min = 4, age_max = 5, moment = "soir", themes = { "nuit", "nature" },
            paragraphes = {
                "Ce soir, la lune est toute fine, comme un sourire. « Oh ! s'étonne {heros.nom}. Quelqu'un a mangé la lune ? »",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, rit doucement. « Mais non ! La lune joue à cache-cache avec l'ombre. Chaque soir, elle se montre un peu plus. »",
                "Alors chaque soir, {heros.nom} regarde. Le sourire devient une demi-lune, puis presque un rond, puis… une grosse lune toute ronde, comme une crêpe dorée !",
                "« Elle est revenue en entier ! » s'écrie {heros.nom}. Et la lune, tout là-haut, a l'air de faire un clin d'œil.",
            },
        },
        {
            id = "potager",
            titre = { "Le potager", "La carotte têtue" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "nature", "humour" },
            paragraphes = {
                "Aujourd'hui, {heros.nom} aide au potager. Il y a des carottes cachées sous la terre, des tomates rouges et de gros potirons orange.",
                "{^heros.nom} tire sur les feuilles d'une carotte. Elle ne veut pas sortir ! {^heros|Il|Elle} tire plus fort… plus fort… Pop ! {^heros|Il|Elle} tombe sur les fesses, la carotte dans les bras !",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, rit et vient aider. {^duo|Ils|Elles} remplissent un grand panier de légumes de toutes les couleurs.",
                "Pour le dîner, avec tous ces légumes, on prépare une grande soupe qui sent bon. Tout le monde en reprend deux fois. « C'est meilleur quand on a tout cueilli soi-même ! »",
            },
        },
        {
            id = "abeilles",
            titre = { "Chez les abeilles", "La goutte de miel" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "nature" },
            paragraphes = {
                "{^heros.nom} entend un drôle de bruit : bzz, bzz, bzz. C'est une abeille, qui butine de fleur en fleur.",
                "« Qu'est-ce que tu fais ? » demande {heros.nom}. « Je ramasse le nectar des fleurs, répond l'abeille. Avec ça, on fabrique du miel dans notre ruche. »",
                "L'abeille montre le chemin jusqu'à la ruche. Des centaines d'abeilles y travaillent, toutes ensemble, sans jamais se disputer.",
                "Pour fêter cette visite, la reine des abeilles offre une petite goutte de miel doré. Miam ! C'est doux comme un câlin.",
                "« Merci, les abeilles ! » En repartant, {heros.nom} fait très attention à ne pas écraser les fleurs. Ce sont les jardins des abeilles.",
            },
        },
    },
}
