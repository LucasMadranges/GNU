#!/bin/bash
# Dossier à sauvegarder (ex: les données du LVM)
SOURCE="/data"
# Dossier de destination des backups
DEST="/backups/archives"
mkdir -p $DEST

# Génération du nom avec date et heure
DATE=$(date +%Y-%m-%d_%Hh%M)
NOM_FICHIER="backup_full_$DATE.tar.gz"

# Création de l'archive (c: create, z: gzip, f: file)
tar -czf "$DEST/$NOM_FICHIER" "$SOURCE"

echo "Sauvegarde complète terminée : $DEST/$NOM_FICHIER"
