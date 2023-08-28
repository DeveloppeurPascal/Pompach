# 20220705 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* point sur le programme et les choses à faire aujourd'hui
* recréation de l'icône en utilisant Pic Mob Generator
* adaptaptation du chemin d'accès au keystore Android suite à changement d'arborescence dans le dossier du projet
* adaptaptation du chemin d'accès aux icônes existantes suite à génération des nouveaux fichiers
* adaptaptation du chemin d'accès aux splash screens existants suite à changement d'arborescence
* ouverture du projet et retrait des composants TMS FMX et JVE Soft qui ne sont pas référencé dans l'IDE et doivent de toute façon être remplacés par d'autres pour cette nouvelle version du jeu
* ajout de la plateforme Linux 64 bits
* ajout de la plateforme macOS ARM 64 bits
* vérification et mise à niveau des permissions et liste des droits pour les plateformes (en particulier AdMob retiré pour Android)
* mise à niveau des options du manifeste pour Windows
* mise à jour des icônes et images de lancement dans les options de projet (correction pointage des anciennes, ajout de nouvelles tailles)
* mise à jour des infos de version du projet, modification du DPROJ pour macOS qui affiche les données iOS64 puis changement du numéro de version de production à 1.1 au lieu de 1.0.0
* suppression de tout ce qui touchait le bandeau publicitaire et AdMob (activés uniquement sur iOS et Android)
* ajout dépendance au projet "librairies" sur GitHub
* remplacement de uParams du dossier du projet par la version de la librairie (Olf.RTL.Params)
* modification du chemin de stockage des paramètres par défaut avec déplacement du fichier existant
* modification du chemin de stockage des scores avec déplacement du fichier existant
* renommage du bouton "options" (inutile car pas d'options dans le jeu) par un bouton Quitter
* activer le bouton "quitter" dans le menu du programme pour Windows / Mac / Linux et l'enlever pour Android et iOS
* prendre en compte ESC sur le menu du jeu pour quitter le programme
* dessin de la pile sous forme de cadre FMX
* nettoyage du code en attendant de refaire le fonctionnement de la pile et du jeu
* fin du traitement de l'affichage de la pile
* adaptations de la gestion du niveau de batterie dans le programme principal
* gestion des flèches (nouvelles images, nouveau fonctionnement pour l'affichage)
* tests et ajustements sur le fonctionnement, les couleurs, le calcul du score, animation de la charge, ...
* test Windows
* test Android
* test macOS Intel
* test macOS ARM
* test iOS

16h33
16h40
17h12
17h58
19h57
20h22
21h11