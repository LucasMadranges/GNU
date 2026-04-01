#!/bin/bash
# Script de monitoring LVM - Alerte au-delà de 80%

SEUIL=80

# On récupère l'utilisation des Logical Volumes (LV)
df -h | grep "/dev/mapper/" | while read line; do
    USAGE=$(echo $line | awk '{print $5}' | sed 's/%//')
    NOM=$(echo $line | awk '{print $1}')
    
    if [ $USAGE -gt $SEUIL ]; then
        echo "⚠️ ALERTE : Le volume $NOM est utilisé à $USAGE% !"
    else
        echo "✅ Volume $NOM : $USAGE% utilisé (OK)."
    fi
done
