-- Les héros et compagnons des histoires inventées.
--
-- nom      prénom du personnage (éviter les prénoms qui commencent par une voyelle)
-- un, le   le personnage avec son article
-- genre    "m" ou "f", pour accorder le reste du texte
-- detail   complément qui le décrit, placé après "un petit lapin"
-- aime     ce qu'il préfère
-- depasse  ce qu'on voit dépasser de sa cachette
-- maison   où il habite, avec "son" ou "sa"
-- gouter   ce qu'il emporte en voyage
return {
    personnages = {
        { id = "lapin", nom = "Pompon", un = "un petit lapin", le = "le petit lapin", genre = "m",
          detail = "aux longues oreilles toutes douces", aime = "les carottes croquantes",
          depasse = "deux longues oreilles", maison = "son terrier", gouter = "trois carottes croquantes" },
        { id = "souris", nom = "Noisette", un = "une petite souris", le = "la petite souris", genre = "f",
          detail = "aux moustaches qui frétillent", aime = "les miettes de gâteau",
          depasse = "une petite queue rose", maison = "sa maison au pied du vieux mur", gouter = "un morceau de fromage" },
        { id = "ourson", nom = "Bruno", un = "un ourson", le = "l'ourson", genre = "m",
          detail = "à la fourrure toute chaude", aime = "le miel doré",
          depasse = "une oreille toute ronde", maison = "sa grotte", gouter = "un petit pot de miel" },
        { id = "chouette", nom = "Plume", un = "une petite chouette", le = "la petite chouette", genre = "f",
          detail = "aux grands yeux ronds", aime = "regarder les étoiles",
          depasse = "le bout d'une aile", maison = "son nid au creux d'un arbre", gouter = "une poignée de graines" },
        { id = "herisson", nom = "Léon", un = "un petit hérisson", le = "le petit hérisson", genre = "m",
          detail = "aux piquants tout ronds", aime = "les pommes bien rouges",
          depasse = "une rangée de piquants", maison = "son lit de feuilles", gouter = "une pomme bien rouge" },
        { id = "tortue", nom = "Lila", un = "une petite tortue", le = "la petite tortue", genre = "f",
          detail = "à la carapace toute verte", aime = "les feuilles de salade",
          depasse = "le bord d'une carapace verte", maison = "sa petite maison de pierres", gouter = "trois feuilles de salade" },
        { id = "elephant", nom = "Gaston", un = "un petit éléphant", le = "le petit éléphant", genre = "m",
          detail = "à la trompe rigolote", aime = "les bains de boue",
          depasse = "le bout d'une trompe", maison = "sa grande cabane", gouter = "un sac de cacahuètes" },
        { id = "vache", nom = "Rosalie", un = "une petite vache", le = "la petite vache", genre = "f",
          detail = "aux grosses taches noires", aime = "l'herbe fraîche du matin",
          depasse = "deux petites cornes", maison = "son étable", gouter = "un bouquet d'herbe fraîche" },
        { id = "renard", nom = "Filou", un = "un petit renard", le = "le petit renard", genre = "m",
          detail = "à la queue toute touffue", aime = "jouer à cache-cache",
          depasse = "le bout d'une queue rousse", maison = "son terrier", gouter = "une poignée de mûres" },
        { id = "chatte", nom = "Mimi", un = "une petite chatte", le = "la petite chatte", genre = "f",
          detail = "au poil tout doux", aime = "les pelotes de laine",
          depasse = "deux oreilles pointues", maison = "son panier", gouter = "un bol de lait" },
        { id = "dragon", nom = "Coco", un = "un petit dragon", le = "le petit dragon", genre = "m",
          detail = "qui crache des bulles de savon au lieu du feu", aime = "les bulles",
          depasse = "une petite aile verte", maison = "sa grotte", gouter = "une flûte de bulles" },
        { id = "poule", nom = "Pépita", un = "une petite poule", le = "la petite poule", genre = "f",
          detail = "aux plumes toutes rousses", aime = "les graines de maïs",
          depasse = "une crête toute rouge", maison = "son poulailler", gouter = "un sac de grains de maïs" },
    },
}
