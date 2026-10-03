-- Les lieux des histoires inventées. Chaque champ est un morceau de phrase
-- complet, avec son article, pour que le texte reste correct quel que soit
-- le lieu tiré.
--
-- nom       "la forêt"           dans  "dans la grande forêt"
-- de        "de la forêt"        detail commence par "où ..."
-- son       une phrase complète sur les bruits du lieu
-- cachette  "derrière un gros tronc d'arbre"
-- lit       où l'on dort        tresor  une petite chose qu'on y trouve
return {
    lieux = {
        { id = "foret", nom = "la forêt", dans = "dans la grande forêt", de = "de la forêt",
          detail = "où les arbres chuchotent avec le vent", son = "les feuilles font frou-frou",
          cachette = "derrière un gros tronc d'arbre", lit = "un petit lit de mousse",
          tresor = "une pomme de pin toute ronde" },
        { id = "jardin", nom = "le jardin", dans = "au fond du jardin", de = "du jardin",
          detail = "où poussent les fraises et les tomates", son = "l'arrosoir fait plic-ploc",
          cachette = "derrière le tas de feuilles", lit = "un petit lit de pétales",
          tresor = "une fraise bien rouge" },
        { id = "plage", nom = "la plage", dans = "sur la plage", de = "de la plage",
          detail = "où les vagues viennent jouer avec le sable", son = "les vagues font chhh, chhh",
          cachette = "derrière un gros rocher", lit = "un petit lit de sable chaud",
          tresor = "un joli coquillage" },
        { id = "montagne", nom = "la montagne", dans = "en haut de la montagne", de = "de la montagne",
          detail = "où la neige brille comme du sucre", son = "le vent fait hou-hou",
          cachette = "derrière un gros bonhomme de neige", lit = "un abri tout douillet sous un sapin",
          tresor = "une petite pierre qui brille" },
        { id = "prairie", nom = "la prairie", dans = "au milieu de la prairie", de = "de la prairie",
          detail = "où les fleurs dansent au soleil", son = "les abeilles font bzz, bzz",
          cachette = "dans les hautes herbes", lit = "un petit lit de trèfles",
          tresor = "une fleur jaune comme le soleil" },
        { id = "ferme", nom = "la ferme", dans = "à la ferme", de = "de la ferme",
          detail = "où les animaux se disent bonjour chaque matin", son = "le vieux tracteur fait teuf-teuf",
          cachette = "derrière une botte de foin", lit = "un petit lit de paille",
          tresor = "une plume toute légère" },
        { id = "riviere", nom = "la rivière", dans = "au bord de la rivière", de = "de la rivière",
          detail = "où l'eau fait des bulles en chantant", son = "l'eau fait glou-glou",
          cachette = "derrière les grands roseaux", lit = "un petit lit d'herbe fraîche",
          tresor = "un galet tout lisse" },
        { id = "nuages", nom = "le pays des nuages", dans = "au pays des nuages", de = "du pays des nuages",
          detail = "où tout est blanc et moelleux comme de la barbe à papa", son = "les nuages font pouf, pouf",
          cachette = "derrière un gros nuage", lit = "un petit lit de nuage",
          tresor = "une goutte de pluie qui brille comme une perle" },
    },
}
