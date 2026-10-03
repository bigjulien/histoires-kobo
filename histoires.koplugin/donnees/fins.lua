-- Les fins des histoires composées. Une fin ne parle que du héros, du
-- lieu, de l'enfant et du doudou : le compagnon n'apparaît pas dans
-- toutes les intrigues.
return {
    fins = {
        { id = "rentre_maison", moments = { "jour" }, paragraphes = {
            "Le soir venu, {heros.nom} rentre dans {heros.maison}. {^heros|Il|Elle} se blottit sous sa couverture en repensant à cette belle journée. Bonne nuit, {heros.nom}.",
        } },
        { id = "sourire_lune", moments = { "jour" }, paragraphes = {
            "Quand la lune se lève, {heros.nom} dort déjà, avec un petit sourire au coin des lèvres. Fais de beaux rêves, {heros.nom}. Et toi aussi, {enfant}.",
        } },
        { id = "fatigue_content", moments = { "jour" }, paragraphes = {
            "Voilà, c'est la fin de cette histoire. {^heros.nom} est {heros|fatigué|fatiguée}, mais tellement {heros|content|contente} !",
            "Et toi, {enfant}, qu'est-ce qui t'a fait sourire dans cette histoire ?",
        } },
        { id = "musique_lieu", moments = { "jour" }, paragraphes = {
            "Le soir, {heros.nom} rentre chez {heros|lui|elle} en chantonnant. Tout autour, {lieu.son}. {^heros|Il|Elle} s'endort en écoutant cette douce musique.",
        } },
        { id = "raconte_doudou", moments = { "jour" }, paragraphes = {
            "Ce soir-là, {heros.nom} s'endort en pensant à sa journée.",
            "Et toi, {enfant}, as-tu passé une belle journée ? Raconte-la à {doudou}, tout bas, avant de fermer les yeux.",
        } },
        { id = "dodo_lit", moments = { "soir" }, paragraphes = {
            "Maintenant, {heros.nom} bâille un grand coup. {^heros|Il|Elle} se blottit dans {lieu.lit}, ferme les yeux et s'endort. Chut… Bonne nuit, {heros.nom}.",
        } },
        { id = "etoiles_au_dessus", moments = { "soir" }, paragraphes = {
            "Les étoiles brillent au-dessus {lieu.de}. {^heros.nom} dort à poings fermés. Et toi aussi, {enfant}, il est temps de faire dodo.",
        } },
        { id = "lune_veille", moments = { "soir" }, paragraphes = {
            "Tout là-haut, la lune veille sur {heros.nom} jusqu'au matin.",
            "Bonne nuit, {enfant}. Fais un gros câlin à {doudou}.",
        } },
        { id = "un_oeil", moments = { "soir" }, paragraphes = {
            "{^heros.nom} ferme un œil, puis l'autre. Rrrr… rrrr…",
            "Et toi, {enfant}, tu fermes les yeux, toi aussi ?",
        } },
        { id = "signe_bonne_nuit", moments = { "jour", "soir" }, paragraphes = {
            "Et voilà, l'histoire est finie. {^heros.nom} te fait un petit signe : « Bonne nuit, {enfant} ! »",
        } },
        { id = "bonne_nuit_tous", moments = { "jour", "soir" }, paragraphes = {
            "Bonne nuit, {heros.nom}. Bonne nuit, {lieu.nom}. Et bonne nuit à toi, {enfant}.",
        } },
        { id = "demain", moments = { "jour", "soir" }, paragraphes = {
            "Et demain ? Demain, {heros.nom} vivra une nouvelle aventure. Mais pour l'instant, chut… c'est l'heure de dormir.",
        } },
    },
}
