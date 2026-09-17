# L'alternative avec un site "méta" ultra simple généré avec un fichier html brut.

Ma page d'html brut joue le rôle d'une carte de visite ultra simple qui donne un aiguillage vers les sites en anglais et français. 

Cette pirouette me permet d'éviter d'avoir la barre des menus qui change de langue quand on bascule d'un site à l'autre. J'avais testé avec les profils de quarto `quarto render --profil en` mais j'avais toujours des problèmes de barre des menus qui restait dans une langue alors que le contenu était dans l'autre. Ici, je teste donc la configuration suivante : 

- Un fichier intex.html tout simple qui permet de choisir le site en anglais ou en français
- Un quarto site en anglais 
- Un quarto site en français. 

Les deux quartos sites anglais et français sont indépendants. On passe de l'un à l'autre en utilisant les liens vers les fichiers html générés par quarto render.

Pour l'intégration dans github, il va falloir faire un fichier d'intégration qui reproduit la "bonne recette de cuisine" via les GitHub Actions. 

## La routine pour que ça marche en local :

1. Aller dans le répertoire `/en/` et faire `quarto render`. ça va générer le site en anglais dans `/en/_site-en/`.
2. Faire pareil dans `/fr/` avec `quarto render` pour générer le site en français dans `/fr/_site-fr/`. 

On remarque ici que dans les noms des repertoires `_site-fr` et `_site-en` les particules `-fr` et `-en` sont redondantes avec le chemin du répertoire : la cas échéant on pourra modifier les noms du répertoire de destination des fichiers html dans le fichier `_quarto.yml`.

3. Pour visualiser le site web en local, il faut utiliser un serveur HTTP local, car en faisant simplement `firefox index.html̀`, on obtient des erreurs 404 quand on clique vers les liens sur les index.html de l'autre lanque (pour changer de lanque pendant la navigation). Pour contourner cela, dans un terminal se placer dans le répertoire du site "méta" et faire les commandes suivantes dans un teminal : 
   
   ```
   cd repertoire\ou\se\trouve\le\fichier\index.html
   python3 -m http.server 8000
   firefox http://localhost:8000/
   ```

## La routine pour intégrer tout cela dans github : on va faire avec des GitHub Actions# test-quarto-bilingue
