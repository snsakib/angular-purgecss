#!/bin/bash

# production build
echo "production build running..."
ng build --prod --output-hashing none --outputPath docs --base-href /angular-purgecss/

# go to your dist/yourProjectName folder
cd ./dist/angular-purgecss
echo "inside ./dist/angular-purgecss"

# make a new directory named 'css' (you can name it anything)
mkdir css
echo "created new directory named 'css'"

# run purgecss & make a new .css file inside the 'css' directory
echo "running purgecss"
purgecss --css ./styles.css --content ./index.html ./*.js --out ./css

# replace the 'dist/yourProjectName/styles.css' file with the 'dist/yourProjectName/css/styles.css' file
echo "moving styles.css file"
mv ./css/styles.css ./styles.css
echo "move complete"

# delete the previously created 'css' directory
rm -r css

