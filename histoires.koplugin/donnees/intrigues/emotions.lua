-- Intrigues sur les émotions : la peur, la colère, la jalousie, la tristesse,
-- la timidité. Voir amitie.lua pour les règles d'écriture.

local JEUX = { "à saute-mouton", "à la marelle", "au ballon", "à chat perché", "à cache-cache" }

return {
    intrigues = {
        {
            id = "orage",
            titre = { "L'orage", "{heros.nom} et l'orage" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "peur" },
            paragraphes = {
                "Soudain, le ciel gronde. BRRROUM ! Un orage ! Un grand éclair illumine le ciel.",
                "{^heros.nom} se cache sous sa couverture. « J'ai peur ! » {^compagnon.nom}, {compagnon.un} {compagnon.detail}, vient s'asseoir tout près.",
                "« Tu sais, l'orage, c'est juste le ciel qui fait beaucoup de bruit. Viens, on va compter. Quand il y a un éclair, on compte jusqu'au boum. »",
                "Un éclair ! Un, deux, trois, quatre… BROUM. Un autre éclair ! Un, deux, trois, quatre, cinq, six… broum. « Tu entends ? Le tonnerre est de plus en plus loin. L'orage s'en va ! »",
                "Bientôt, il n'y a plus que la pluie qui fait plic, ploc. Une petite musique toute douce. {^heros.nom} sort la tête de sa couverture. L'orage est parti, et la peur aussi.",
            },
        },
        {
            id = "nouveau_bebe",
            titre = { "Le nouveau bébé", "{heros.nom} devient grand" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "jalousie", "famille" },
            choix = {
                bebe = {
                    { un = "un petit frère", desc = "tout rose et tout fripé", genre = "m" },
                    { un = "une petite sœur", desc = "toute rose et toute fripée", genre = "f" },
                },
            },
            paragraphes = {
                "Depuis quelques jours, il y a un nouveau venu dans la famille : {bebe.un}, {bebe.desc}.",
                "Tout le monde s'occupe du bébé. On lui chante des chansons, on le berce, on lui fait des bisous. Et {heros.nom}, alors ? Personne ne {heros|le|la} regarde !",
                "{^heros.nom} boude dans son coin. « Je ne l'aime pas, ce bébé. {^bebe|Il|Elle} prend toute la place. »",
                "Maman vient s'asseoir tout près. « Tu sais, mon cœur, l'amour, c'est comme une bougie. Quand on allume une deuxième bougie avec la première, la première ne brille pas moins. Il y a juste deux fois plus de lumière. »",
                "Juste à ce moment, le bébé tend sa toute petite main et attrape {heros.nom} par le bout du doigt. Et {bebe|il|elle} sourit. Un vrai sourire, rien que pour {heros|lui|elle}.",
                "{^heros.nom} sourit aussi. « Bon… je veux bien t'apprendre plein de choses. Parce que moi, je suis {heros|le grand frère|la grande sœur} ! »",
            },
        },
        {
            id = "danse_du_volcan",
            titre = { "La danse du volcan", "Le volcan qui gronde" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "colere" },
            choix = {
                jeux = JEUX,
                contrariete = { "il se met à pleuvoir des cordes", "le ballon est tout dégonflé",
                                "son jeu préféré est cassé", "c'est déjà l'heure de rentrer" },
            },
            paragraphes = {
                "Ce jour-là, {heros.nom} voulait jouer {jeux}. Mais {contrariete}.",
                "La colère monte, monte, comme un volcan ! {^heros.nom} tape du pied, devient {heros|tout rouge|toute rouge} et crie : « Ce n'est pas juste ! »",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, ne se moque pas. « Ta colère a le droit d'être là. Mais on peut la faire sortir sans rien casser. Tu veux essayer la danse du volcan ? »",
                "On tape très fort des pieds : boum, boum, boum ! On secoue les bras comme des branches dans la tempête ! On rugit comme un lion : ROOOAAAR ! Puis on danse de plus en plus doucement… doucement… et on s'arrête.",
                "{^heros.nom} souffle un grand coup. Le volcan s'est endormi. « Ça va mieux. » Et {duo|ils|elles} trouvent un autre jeu, tout aussi rigolo.",
            },
        },
        {
            id = "chanter_devant_tous",
            titre = { "Les jambes en coton", "{heros.nom} chante pour la fête" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "timidite", "courage" },
            paragraphes = {
                "Aujourd'hui, c'est la grande fête {lieu.de}, et {heros.nom} doit chanter une chanson devant tout le monde.",
                "Mais plus le moment approche, plus {heros.nom} a les jambes en coton. « Et si je me trompe ? Et si tout le monde se moque de moi ? »",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, lui chuchote un secret : « Quand tu chantes, ne regarde pas tout le monde. Regarde-moi, juste moi. Comme si on était seuls. »",
                "Le moment arrive. {^heros.nom} monte sur la grosse pierre qui sert de scène et cherche {compagnon.nom} des yeux. {compagnon|Le voilà|La voilà} ! {^compagnon|Il|Elle} fait un clin d'œil.",
                "Alors {heros.nom} chante. D'abord tout bas, puis un peu plus fort, puis à pleine voix ! À la fin, tout le monde applaudit : clap, clap, clap !",
                "{^heros.nom} est rouge comme une tomate, mais {heros|fier|fière} comme un paon. Avoir peur, et le faire quand même, c'est ça, le vrai courage.",
            },
        },
        {
            id = "ballon_envole",
            titre = { "Le ballon envolé" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "tristesse" },
            choix = {
                couleur = { "rouge", "jaune", "bleu", "vert" },
                destination = { "chez la lune, pour lui faire un cadeau", "au-dessus de la mer, pour voir les baleines",
                                "au pays des nuages, pour jouer avec eux", "jusqu'aux étoiles, pour leur dire bonjour" },
            },
            paragraphes = {
                "Aujourd'hui, {heros.nom} a reçu un beau ballon {couleur}, attaché à une longue ficelle.",
                "Mais une rafale de vent arrive. Fffouuu ! La ficelle glisse, et le ballon s'envole, haut, très haut dans le ciel. {^heros.nom} se met à pleurer.",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, s'assoit à côté. {^compagnon|Il|Elle} ne dit pas « ce n'est rien ». {^compagnon|Il|Elle} dit : « Tu es triste. C'est normal, il était si beau, ce ballon. » Et {compagnon|il|elle} fait un câlin.",
                "Quand les larmes sont finies, {compagnon.nom} montre le ciel. « Regarde, on le voit encore, tout petit. Où crois-tu qu'il va ? » {^heros.nom} réfléchit. « Peut-être… {destination} ! »",
                "En inventant ensemble le grand voyage du ballon, {heros.nom} retrouve le sourire.",
            },
        },
        {
            id = "peur_de_l_eau",
            titre = { "{heros.nom} se jette à l'eau", "Les bulles" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "peur", "courage" },
            lieux = { "plage", "riviere" },
            paragraphes = {
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, barbote déjà dans l'eau. « Viens ! Elle est bonne ! » Mais {heros.nom} reste sur le bord. L'eau, ça lui fait peur.",
                "« On va y aller tout doucement », dit {compagnon.nom}. D'abord, juste le bout des pieds. Brrr, c'est frais ! Puis jusqu'aux genoux. Puis jusqu'au ventre.",
                "« Maintenant, fais comme moi : on souffle des bulles. » Blou, blou, blou ! {^heros.nom} éclate de rire. Les bulles chatouillent le nez !",
                "À la fin de la journée, {heros.nom} fait la planche, les bras en étoile, en regardant le ciel. « Je n'ai plus peur ! » Petit à petit, on peut tout apprendre.",
            },
        },
        {
            id = "dernier_gateau",
            titre = { "Le dernier gâteau" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "partage" },
            paragraphes = {
                "{^heros.nom} et {compagnon.nom}, {compagnon.un} {compagnon.detail}, ont fait des petits gâteaux. Miam ! Mais il n'en reste plus qu'un seul.",
                "{^heros.nom} le regarde. Il a l'air si bon… {^heros|Il|Elle} a très envie de le manger tout entier.",
                "{^compagnon.nom} le regarde aussi. {^compagnon|Il|Elle} ne dit rien, mais son ventre fait grrr, grrr.",
                "Alors {heros.nom} prend le gâteau et le coupe en deux. « Une moitié pour toi, une moitié pour moi. »",
                "{^compagnon.nom} sourit jusqu'aux oreilles. Et c'est drôle : ce demi-gâteau a meilleur goût que n'importe quel gâteau entier.",
            },
        },
        {
            id = "cerf_volant",
            titre = { "Le cerf-volant", "{heros.nom} n'abandonne pas" },
            age_min = 4, age_max = 5, moment = "jour", themes = { "perseverance" },
            paragraphes = {
                "Aujourd'hui, {heros.nom} essaie de faire voler un cerf-volant. {^heros|Il|Elle} court, tire sur la ficelle… et paf ! Le cerf-volant tombe par terre.",
                "{^heros|Il|Elle} essaie encore. Paf ! Et encore. Paf ! « Je suis {heros|nul|nulle} ! Je n'y arriverai jamais ! »",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, s'approche. « Tu n'es pas {heros|nul|nulle}, tu es en train d'apprendre. Regarde : il faut attendre que le vent souffle, et courir face à lui. »",
                "{^heros.nom} attend. Le vent se lève. Vite ! {^heros|Il|Elle} court, court, court… et le cerf-volant monte, monte, monte jusqu'aux nuages !",
                "« J'ai réussi ! » crie {heros.nom}. Ce n'était pas facile, mais c'est justement pour ça que c'est si bon.",
            },
        },
        {
            id = "premiere_nuit_ailleurs",
            titre = { "La première nuit chez un ami", "La veilleuse étoilée" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "separation", "amitie" },
            paragraphes = {
                "Ce soir, pour la première fois, {heros.nom} dort chez {compagnon.nom}, {compagnon.un} {compagnon.detail}. Quelle aventure !",
                "{^duo|Ils|Elles} jouent, {duo|ils|elles} rient, {duo|ils|elles} mangent une soupe toute chaude. Mais quand vient l'heure d'éteindre la lumière, {heros.nom} sent un petit pincement au cœur. {^heros.maison} lui manque.",
                "« Tu es triste ? » demande {compagnon.nom}. « Un peu. Ma maison me manque. »",
                "{^compagnon.nom} réfléchit, puis lui prête sa veilleuse en forme d'étoile. « Tiens. Avec elle, le noir devient tout doux. »",
                "La petite lumière dessine des étoiles au plafond. {^heros.nom} les compte : une, deux, trois… Et demain, {heros|il|elle} aura plein de choses à raconter en rentrant chez {heros|lui|elle}.",
            },
        },
    },
}
