-- Intrigues pour rire. Voir amitie.lua pour les règles d'écriture.

return {
    intrigues = {
        {
            id = "atchoum",
            titre = { "Le grand atchoum" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "humour" },
            paragraphes = {
                "Ce matin, {heros.nom} a le nez qui chatouille. Ça gratte, ça pique… A… a… ATCHOUM !",
                "L'éternuement est si fort que toutes les feuilles s'envolent, tourbillonnent, et retombent sur un vieux crapaud qui dormait. « Hé ! » grogne le crapaud.",
                "A… a… ATCHOUM ! Cette fois, c'est le chapeau de l'épouvantail qui s'envole !",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, arrive en courant et lui tend un mouchoir grand comme un drap.",
                "{^heros.nom} se mouche : POUUUET ! Si fort que tout le monde éclate de rire, même le vieux crapaud.",
            },
        },
        {
            id = "s_habiller",
            titre = { "{heros.nom} s'habille", "Le pull à l'envers" },
            age_min = 2, age_max = 4, moment = "jour", themes = { "humour", "autonomie" },
            paragraphes = {
                "Ce matin, {heros.nom} veut s'habiller {heros|tout seul|toute seule}. {^heros|Il|Elle} met son pantalon… sur la tête ! « Non, ça ne va pas là ! »",
                "{^heros|Il|Elle} met ses chaussettes… sur les oreilles ! « Non plus ! »",
                "{^heros|Il|Elle} met son pull… à l'envers ! Les manches pendent comme deux trompes.",
                "{^compagnon.nom}, {compagnon.un} {compagnon.detail}, passe par là et rit aux éclats. « On dirait un épouvantail rigolo ! »",
                "Alors {heros.nom} recommence, bien dans l'ordre. Le pantalon sur les jambes, les chaussettes sur les pieds, le pull à l'endroit. « Ta-daa ! » Et voilà {heros.nom}, {heros|bien habillé|bien habillée} !",
            },
        },
        {
            id = "gateau_rate",
            titre = { "Le gâteau le plus bizarre du monde" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "humour", "cuisine" },
            choix = { ingredients = { "une pincée de sable", "deux cornichons", "une feuille de salade",
                                      "beaucoup de poivre", "un peu de moutarde" } },
            paragraphes = {
                "{^heros.nom} et {compagnon.nom}, {compagnon.un} {compagnon.detail}, veulent faire un gâteau. Mais {duo|ils|elles} n'ont pas de recette !",
                "Dans le grand saladier, {duo|ils|elles} mettent de la farine, des œufs, du sucre… et aussi {ingredients#1}, puis {ingredients#2} !",
                "{^duo|Ils|Elles} mélangent, mettent au four, et attendent. Ding ! Le gâteau est prêt. Il est tout plat, tout vert, et il sent… très bizarre.",
                "{^heros.nom} goûte. {^compagnon.nom} goûte. {^duo|Ils|Elles} se regardent, font une grimace terrible, et éclatent de rire. « Beurk ! »",
                "Alors {duo|ils|elles} recommencent, avec seulement de la farine, des œufs, du sucre et du beurre. Cette fois, le gâteau est délicieux. Mais le premier, {duo|ils|elles} s'en souviendront longtemps !",
            },
        },
        {
            id = "le_bain",
            titre = { "Pas de bain !", "Le bain moussant" },
            age_min = 2, age_max = 4, moment = "soir", themes = { "humour", "routine" },
            paragraphes = {
                "« C'est l'heure du bain ! » Mais {heros.nom} ne veut pas. « Non, non et non ! Je ne suis pas sale ! »",
                "Pourtant, {heros.nom} a de la boue sur le nez, de la confiture sur les joues et des brindilles un peu partout.",
                "Dans la baignoire, il y a de la mousse, beaucoup de mousse. Et un petit canard jaune qui fait coin-coin.",
                "Bon… juste un pied. Puis deux. Et hop, dans le bain ! {^heros.nom} se fait une barbe de mousse, un chapeau de mousse, et souffle des bulles grosses comme des ballons.",
                "« Encore cinq minutes ! » supplie {heros.nom} quand il faut sortir. Tout le monde rit : tout à l'heure, {heros|il|elle} ne voulait pas y aller !",
            },
        },
        {
            id = "grosse_voix",
            titre = { "La grosse voix" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "humour", "peur" },
            choix = { petit = { "un tout petit escargot", "une minuscule coccinelle", "un petit grillon tout fier" } },
            paragraphes = {
                "En se promenant, {heros.nom} entend une GROSSE VOIX : « QUI VA LÀ ? »",
                "{^heros.nom} tremble. Ça doit être un géant ! Ou un ogre ! Ou un énorme monstre poilu !",
                "« QUI VA LÀ ? » répète la grosse voix, qui sort d'un vieux tuyau posé dans l'herbe.",
                "{^heros.nom} se penche, tout doucement… et découvre {petit}, qui parle dans le tuyau pour se faire une grosse voix !",
                "« Je t'ai fait peur ? » demande la petite bête, très fière. « Un peu ! » avoue {heros.nom}. Et tout l'après-midi, on entend des grosses voix sortir du tuyau, et beaucoup de rires.",
            },
        },
        {
            id = "grand_rangement",
            titre = { "La course au rangement" },
            age_min = 3, age_max = 5, moment = "jour", themes = { "humour", "routine" },
            paragraphes = {
                "Dans {heros.maison}, c'est le grand désordre. Des jouets partout, des chaussettes sous le lit, et un vieux trognon de pomme caché sous le tapis !",
                "« Il faut ranger », dit {compagnon.nom}, {compagnon.un} {compagnon.detail}, {compagnon|venu|venue} jouer. {^heros.nom} soupire. Ranger, c'est tellement ennuyeux !",
                "« Et si on faisait une course ? propose {compagnon.nom}. Le premier qui range dix choses a gagné ! » Un, deux, trois, partez !",
                "Les jouets volent dans le coffre, les livres sautent sur l'étagère, les chaussettes filent dans le panier. En un clin d'œil, tout est rangé !",
                "« Égalité ! » Et sous le tapis, {heros.nom} retrouve même {objet.son}, qu'{heros|il|elle} cherchait depuis des jours.",
            },
        },
        {
            id = "ronfleur",
            titre = { "Qui ronfle comme ça ?" },
            age_min = 3, age_max = 5, moment = "soir", themes = { "humour", "nuit" },
            paragraphes = {
                "Ce soir, impossible de dormir ! Quelqu'un ronfle très fort : RRRRRR… PSHHHH… RRRRRR… PSHHHH…",
                "{^heros.nom} se bouche les oreilles. « Qui fait ce vacarme ? » C'est {compagnon.nom}, {compagnon.un} {compagnon.detail}, qui dort à poings fermés juste à côté !",
                "{^heros.nom} essaie de compter les moutons. Un mouton, deux moutons… RRRRRR ! Les moutons s'enfuient.",
                "Alors {heros.nom} a une idée. {^heros|Il|Elle} chante tout doucement une berceuse : « Dors, dors, sans faire de bruit… »",
                "Et le ronflement devient un tout petit ronflement : rrr… pshh… rrr… Comme une petite musique. {^heros.nom} sourit. Finalement, c'est plutôt joli.",
            },
        },
    },
}
