# GNU - Linux

Notes importantes : Cette VM à été créé sur UTM (seulement sur MacOS), il se peut que l'ouverture du fichier UTM avec un autre moteur de virutalisation ne fonctionne pas. Référez-vous à l'installation plus bas.

## Fichiers
data : Dossier de tous les bash présent sur la VM.
projet.pdf : Fichier PDF pour toutes les explications de la mise en place de la VM.
Lien vers la VM : [URL Google Drive](https://drive.google.com/drive/folders/1CSJpqhYB68V3X_e9vmtggdjGD2I03W2Y?usp=sharing)

## Connexion à la VM
username : lucasmdr
mot de passe : lucasmdr

## Installation

Si vous utilisez UTM (macos only) : 
- Lancer le fichier UTM précédemment installer, la VM devrait apparaître sur l'interface.

Si vous n'utilisez pas UTM :
- Créez une nouvelle VM (Ubuntu 64-bit).
- Ouvrez le dossier nommer "Disks".
- Dans Système : Attachez le fichier .qcow2 le plus lourd pour le Disque 1.
- Pour Disques 2 & 3 (LVM) : Attachez les deux autres fichiers .qcow2 comme disques secondaires (nécessaire pour la Partie 2 du projet).
- Remettez les mêmes identifiants.