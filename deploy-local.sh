#!/bin/bash
# ========================================
# Génération des sites
# ========================================

# Arrête le script si une commande échoue
set -e

echo "=== Quarto rendering steps ==="
# Génère le site en français puis en anglais
cd fr/
quarto render
cd ../en/
quarto render
cd ..

# Supprime l'ancien répertoire de déploiement
echo "=== Nettoyage ==="
if [ -d _site ]; then
    echo "_site existe déjà, suppression..."
    rm -rf _site
fi

echo "=== Creating the public repertory for the webpages ==="
mkdir _site
cp -r fr/_site-fr/ _site/_site-fr
cp -r en/_site-en/ _site/_site-en
cp index.html _site/
cp style.css _site/
echo "Done. Run serve-local.sh to preview the webpages."
