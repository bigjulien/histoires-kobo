# Histoires pour Kobo

Des histoires du soir en français pour les enfants de 2 à 5 ans, sur une liseuse
Kobo (pensé pour la Clara BW). Tout fonctionne hors ligne, directement sur la
liseuse, sous forme de plugin [KOReader](https://koreader.rocks).

Deux sources d'histoires :

- **la bibliothèque** : des histoires entièrement écrites (l'étoile qui ne voulait
  pas dormir, la colère de Petit Ours, le dragon qui avait le hoquet...) ;
- **le générateur** : neuf trames complètes (bonne nuit, cache-cache, objet perdu,
  peur du noir...) et une soixantaine d'intrigues (amitié, émotions, nature,
  aventure, humour, histoires pour les tout-petits, histoires du soir). Chaque
  intrigue est encadrée par un début et une fin tirés au hasard parmi douze de
  chaque, ce qui donne plus de 2 000 trames différentes à partir de 3 ans (830 à
  2 ans). Le héros, son compagnon, le lieu, l'objet et de nombreux détails sont
  eux aussi tirés au hasard, et le texte s'accorde au genre de chaque personnage.

Les histoires s'adaptent à l'enfant : son prénom, son âge (de 2 à 5 ans, pour
filtrer des histoires plus courtes et répétitives pour les petits, plus longues
pour les grands), le nom de son doudou, et l'enfant peut devenir le héros.

## Installation

Il faut une Kobo avec KOReader installé. NickelMenu est facultatif.

1. Branchez la liseuse à l'ordinateur.
2. Copiez le dossier `histoires.koplugin` dans `.adds/koreader/plugins/`.
3. Facultatif, pour lancer les histoires depuis le menu Kobo : copiez le fichier
   `nickelmenu/histoires` dans `.adds/nm/`.
4. Éjectez la liseuse.

Dans KOReader, les histoires se trouvent dans le menu **Outils > Histoires**. Avec
NickelMenu, l'entrée **Histoires** du menu principal de la Kobo lance KOReader
directement sur l'accueil des histoires.

Vous pouvez aussi associer un geste aux actions « Histoires : accueil » et
« Histoires : une histoire inventée » (Réglages > Taper et balayer > Gestes).

## Utilisation

L'accueil propose :

- **Une histoire inventée** : une nouvelle histoire à chaque fois ;
- **Choisir le héros et le lieu** : l'enfant choisit qui part à l'aventure, et où ;
- **Une histoire du livre** et **Toutes les histoires** : la bibliothèque ;
- **Mes histoires préférées** : les histoires gardées avec le bouton « Garder » ;
- **Réglages** : prénom, fille ou garçon, âge, doudou.

Sous chaque histoire, « Une autre ! » en propose une nouvelle, et « Lire comme un
livre » l'ouvre dans le lecteur de KOReader (pages à tourner, taille de police du
lecteur). La taille du texte de la fenêtre d'histoire se règle avec le menu en haut
à gauche de cette fenêtre, et KOReader s'en souvient.

## Ajouter ses propres histoires

Sans toucher au plugin, déposez un ou plusieurs fichiers `.lua` dans le dossier
`.adds/koreader/histoires/` de la liseuse, puis choisissez **Réglages > Recharger la
base d'histoires**. Le fichier [`exemples/mes-histoires.lua`](exemples/mes-histoires.lua)
montre comment ajouter une histoire écrite, une trame, un personnage et un lieu. Une
entrée qui reprend l'`id` d'une entrée existante la remplace.

Dans les textes, `{enfant}` devient le prénom de l'enfant, `{doudou}` « ton doudou »
suivi de son nom, et les trames disposent de toute la syntaxe décrite en tête de
[`generateur.lua`](histoires.koplugin/generateur.lua) (`{heros.nom}`,
`{heros|il|elle}`, `{^...}` pour une majuscule, etc.).

Les fichiers ajoutés sont lus dans un environnement isolé : ils ne peuvent que
déclarer des données.

## Organisation du dépôt

```
histoires.koplugin/        le plugin à copier sur la liseuse
  main.lua                 l'interface KOReader
  generateur.lua           le moteur, sans dépendance à KOReader
  donnees/                 la base : personnages, lieux, objets, trames, histoires,
                           débuts et fins des histoires composées
  donnees/intrigues/       les intrigues, rangées par thème
nickelmenu/histoires       l'entrée NickelMenu
exemples/                  modèle pour ajouter ses histoires
tests/                     vérifications exécutables avec LuaJIT
```

## Tests

```
luajit tests/test_generateur.lua           # génère et vérifie plus de 50 000 histoires
luajit tests/test_interface.lua            # fait tourner l'interface avec de faux widgets
luajit tests/test_generateur.lua exemple   # affiche une histoire au hasard
```

Les tests vérifient que chaque trame produit un texte complet avec chaque héros et
chaque lieu, sans accolade restante, sans « de le » ou « que une », et avec les
espaces insécables de la typographie française.
