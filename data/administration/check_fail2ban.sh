#!/bin/bash

LOG_FILE="/var/log/fail2ban.log"
REPORT_FILE="/home/lucasmdr/fail2ban_alert.log" # Remplace par ton user

echo "--- Rapport de sécurité du $(date) ---" >> "$REPORT_FILE"

# On cherche les lignes contenant "Ban" et on extrait l'IP
grep "Ban " "$LOG_FILE" | awk '{print "IP Bannie : " $NF}' >> "$REPORT_FILE"

if [ $? -eq 0 ]; then
    echo "Analyse terminée. Résumé ajouté dans $REPORT_FILE"
else
    echo "Aucun bannissement récent trouvé."
fi
