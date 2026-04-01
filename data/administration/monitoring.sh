#!/bin/bash

# --- FONCTION MONITORING ---
show_monitoring() {
    echo "--- INFORMATIONS SYSTÈME ---"
    echo "Nom de la machine : $(hostname)"
    echo "Version du noyau  : $(uname -r)"
    
    echo -e "\n--- UTILISATION CPU / MÉMOIRE ---"
    # CPU usage (simple)
    cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    echo "Utilisation CPU : $cpu_load%"
    free -h | grep -E "Mem|Total"
    
    echo -e "\n--- UTILISATION SWAP ---"
    # Calcul du % de Swap utilisé
    swap_total=$(free | grep Swap | awk '{print $2}')
    swap_used=$(free | grep Swap | awk '{print $3}')
    if [ "$swap_total" -gt 0 ]; then
        swap_perc=$((swap_used * 100 / swap_total))
        echo "Swap utilisé : $swap_perc%"
        if [ "$swap_perc" -gt 50 ]; then
            echo "⚠️ ALERTE : Le Swap dépasse 50% !"
        fi
    else
        echo "Pas de partition Swap détectée."
    fi

    echo -e "\n--- ESPACE DISQUE ---"
    df -h --output=target,pcent | grep -v "tmpfs"
    
    # Vérification alerte disque > 80%
    df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
    do
      usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
      partition=$(echo $output | awk '{ print $2 }' )
      if [ $usep -ge 80 ]; then
        echo "⚠️ ALERTE : La partition $partition est à $usep% !"
      fi
    done
}


# --- MENU PRINCIPAL ---
while true; do
    echo -e "\n=============================="
    echo "   PANNEAU D'ADMINISTRATION"
    echo "=============================="
    echo "1. Afficher le monitoring système"
    echo "2. Lancer une sauvegarde complète (tar)"
    echo "3. Lancer une sauvegarde incrémentale (rsync)"
    echo "4. Restaurer et vérifier une archive"
    echo "5. Analyser les logs Fail2Ban"
    echo "6. Quitter"
    echo "=============================="
    read -p "Choisissez une option [1-6] : " choix

    case $choix in
        1) show_monitoring ;;
        2) sudo bash /data/administration/backup_full.sh ;;
        3) sudo bash /data/administration/backup_inc.sh ;;
        4) read -p "Chemin de l'archive : " arc
           sudo bash /data/administration/restore_check.sh "$arc" ;;
        5) sudo bash /data/administration/check_fail2ban.sh ;;
        6) echo "Au revoir !"; exit 0 ;;
        *) echo "Option invalide." ;;
    esac
done
