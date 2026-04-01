#!/bin/bash
SOURCE="/data/"
DEST="/backups/backup_rsync/"
mkdir -p $DEST

# --archive : conserve les droits/dates
# --delete : supprime dans la destination ce qui a été supprimé à la source
# --exclude : ignore les fichiers .tmp ou dossiers temp
rsync -av --delete --exclude='*.tmp' --exclude='temp/' "$SOURCE" "$DEST"

echo "Mise à jour incrémentale rsync terminée."
