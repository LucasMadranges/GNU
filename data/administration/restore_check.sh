#!/bin/bash
if [ -z "$1" ]; then
    echo "Usage: $0 <chemin_vers_archive.tar.gz>"
    exit 1
fi

ARCHIVE=$1
TEMP_RESTORE="/tmp/restore_test"
ORIGINAL="/data"

# 1. Nettoyage et extraction
rm -rf "$TEMP_RESTORE" && mkdir -p "$TEMP_RESTORE"
tar -xzf "$ARCHIVE" -C "$TEMP_RESTORE"

# 2. Comparaison (diff -r compare les répertoires récursivement)
# On adapte le chemin car tar inclut souvent le chemin racine
echo "Comparaison en cours..."
diff -r "$ORIGINAL" "$TEMP_RESTORE/data"

if [ $? -eq 0 ]; then
    echo "✅ Restauration réussie : le contenu est identique à l'original."
else
    echo "⚠️ Attention : Des différences ont été trouvées entre l'original et la sauvegarde."
fi
