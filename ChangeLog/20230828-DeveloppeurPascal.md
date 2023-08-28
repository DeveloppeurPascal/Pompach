# 20230828 - [DeveloppeurPascal](https://github.com/DeveloppeurPascal)

* added "librairies" project as a submodule
* added "Delphi-Game-Engine" project as a submodule
* relookage "léger" et génération des icones
* suppression des unités locales provenants d'autres sous-projets :
=> scores récupérés de "Delphi-Game-Engine"
=> keyboard et textes graphiques récupérés des "librairies"
* déplacement du datamodule contenant les images des caractères dans le dossier privé (pour éviter les problèmes de licences)
* mise à niveau des librairies Android dans les dépendances du projet
* forçage à Android 13 SDK 33 dans le manifest pour Android 32 et 64 bits
* prise en charge du DPAD des contrôleurs de jeux connectés (sur les plateformes compatibles)
* désactivation de l'affichage de la barre de notification / niveau de batterie sur iOS/iPadOS

* déploiement de la version 1.2 - 20230828 pour Android (Amazon AppStore, Google Play et Itch.io), macOS et iOS (iPhone, iPod touch, iPad, iPad Pro)
