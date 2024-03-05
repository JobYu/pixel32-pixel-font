#! /bin/bash

cd "$(dirname "$0")" || exit

rm -f ./*.ttf
java -jar ./bin/BitsNPicas.jar convertbitmap -f ttf -o ./pix32.ttf ../src/pix32.sfd

# minify has a bug for web, OTS parsing error: OS/2: Failed to parse table
# so I'm going to convert woff2 here
# `ttf2woff2` is a npm module, RUN `npm i -g ttf2woff2` install
cat < ./pix32.ttf | ttf2woff2 > ../website/pix32.woff2

./minify.py
mv -f ./pix32.ttf ../dist/pix32.ttf


rm -f ./*.bdf
java -jar ./bin/BitsNPicas.jar convertbitmap -f bdf -o ./pix32bdf ../src/pix32.sfd
mv -f ./pix32.bdf ../dist/pix32.bdf
