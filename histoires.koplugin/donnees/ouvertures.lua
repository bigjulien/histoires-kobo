-- Les débuts des histoires composées. Un début présente le héros et le
-- lieu ; l'intrigue enchaîne ensuite. `moments` dit avec quelles
-- intrigues il va : "jour" (l'histoire se passe dans la journée) ou
-- "soir" (elle se passe le soir ou la nuit).
return {
    ouvertures = {
        { id = "matin_soleil", moments = { "jour" }, paragraphes = {
            "Ce matin, le soleil se lève {lieu.dans}, {lieu.detail}. {^heros.nom}, {heros.un} {heros.detail}, ouvre les yeux et s'étire : « Quelle belle journée ! »",
        } },
        { id = "il_etait_une_fois", moments = { "jour" }, paragraphes = {
            "Il était une fois {heros.un} {heros.detail}, qui s'appelait {heros.nom}. {^heros|Il|Elle} vivait {lieu.dans}, {lieu.detail}.",
        } },
        { id = "connais_tu", moments = { "jour" }, paragraphes = {
            "Connais-tu {heros.nom} ? C'est {heros.un} {heros.detail}, qui adore {heros.aime}. Ce jour-là, {heros.nom} se promène {lieu.dans}.",
        } },
        { id = "toc_toc", moments = { "jour" }, paragraphes = {
            "Toc, toc, toc ! Le soleil frappe à la fenêtre. {^heros.nom}, {heros.un} {heros.detail}, saute du lit, avale son petit déjeuner et file {lieu.dans}.",
        } },
        { id = "la_ou_vit", moments = { "jour" }, paragraphes = {
            "{^lieu.dans}, {lieu.detail}, vit {heros.un} {heros.detail}. {^heros|Il|Elle} s'appelle {heros.nom}.",
        } },
        { id = "beau_temps", moments = { "jour" }, paragraphes = {
            "Ce jour-là, il fait un temps magnifique {lieu.dans}. Tout autour, {lieu.son}. {^heros.nom}, {heros.un} {heros.detail}, a envie d'aventure.",
        } },
        { id = "drole_envie", moments = { "jour" }, paragraphes = {
            "Un matin, {heros.nom}, {heros.un} {heros.detail}, se réveille avec une drôle d'idée : aujourd'hui, quelque chose d'extraordinaire va arriver.",
            "{^heros|Il|Elle} met son plus beau sourire et file {lieu.dans}.",
        } },
        { id = "coucher_soleil", moments = { "soir" }, paragraphes = {
            "Le soleil se couche {lieu.dans}. Le ciel devient tout rose, puis tout violet. {^heros.nom}, {heros.un} {heros.detail}, n'a pas encore sommeil.",
        } },
        { id = "lune_se_leve", moments = { "soir" }, paragraphes = {
            "C'est le soir {lieu.dans}. Tout autour, {lieu.son}, de plus en plus doucement. {^heros.nom}, {heros.un} {heros.detail}, regarde la lune se lever.",
        } },
        { id = "pleine_lune", moments = { "soir" }, paragraphes = {
            "Il était une fois, un soir de pleine lune, {heros.un} {heros.detail} qui s'appelait {heros.nom}. {^heros|Il|Elle} habitait {lieu.dans}, {lieu.detail}.",
        } },
        { id = "premieres_etoiles", moments = { "soir" }, paragraphes = {
            "La nuit tombe {lieu.dans}. Les premières étoiles s'allument, une à une. {^heros.nom}, {heros.un} {heros.detail}, se prépare pour la nuit.",
        } },
        { id = "apres_diner", moments = { "soir" }, paragraphes = {
            "Ce soir, après le dîner, {heros.nom}, {heros.un} {heros.detail}, sort faire un dernier petit tour {lieu.dans}. L'air est doux et tout est calme.",
        } },
    },
}
