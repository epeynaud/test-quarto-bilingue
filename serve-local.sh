#!/bin/bash
# ========================================
# Permet de lancer un serveur html
# ========================================
echo "=== Démarre le serveur local. A faire si nécessaire : changer le port. ===" 
echo " Dans firefox : aller à l'adresse http://localhost:8001/ pour naviguer dans le site."
python3 -m http.server 8001 --directory _site/
