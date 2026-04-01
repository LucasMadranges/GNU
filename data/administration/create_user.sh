#!/bin/bash
# Script d'automatisation - Gestion des comptes

echo "--- Nouvel Utilisateur ---"
read -p "Nom (ex: dev3) : " NEWUSER
read -p "Groupe (admin/developer/intern) : " NEWGRP
read -s -p "Mot de passe : " NEWPASS
echo ""

# Création du groupe s'il n'existe pas
sudo addgroup -f $NEWGRP

# Ajout de l'utilisateur sans interaction GECOS
sudo adduser --ingroup $NEWGRP --disabled-password --gecos "" $NEWUSER

# Application du mot de passe
echo "$NEWUSER:$NEWPASS" | sudo chpasswd

echo "Utilisateur $NEWUSER ajouté au groupe $NEWGRP avec succès."
