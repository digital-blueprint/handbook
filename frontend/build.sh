#!/bin/bash

set -e

cp -R node_modules/mermaid/dist/mermaid.min.js ../docs/assets/js
rm -Rf ../overrides/fonts/*

# See ../docs/assets/styles/fonts.css for which files are needed
mkdir -p ../overrides/fonts/nunito-sans
cp -R node_modules/@fontsource/nunito-sans/latin-{300,300-italic,700}.css ../overrides/fonts/nunito-sans
mkdir -p ../overrides/fonts/nunito-sans/files
cp -R node_modules/@fontsource/nunito-sans/files/nunito-sans-latin-{300-normal,300-italic,700-normal}.woff2 ../overrides/fonts/nunito-sans/files

mkdir -p ../overrides/fonts/roboto-mono
cp -R node_modules/@fontsource/roboto-mono/latin-400.css ../overrides/fonts/roboto-mono
mkdir -p ../overrides/fonts/roboto-mono/files
cp -R node_modules/@fontsource/roboto-mono/files/roboto-mono-latin-400-normal.woff2 ../overrides/fonts/roboto-mono/files
