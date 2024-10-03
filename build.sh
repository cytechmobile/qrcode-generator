#!/bin/bash

if [[ ! -f ./src.tgz ]]; then
  curl -qsL -o src.tgz https://github.com/nayuki/QR-Code-generator/tarball/v1.8.0
fi
rm -rf src
tar -zxf src.tgz
mv nayuki-QR-Code-generator-* src
rm -rf dest/
mkdir -p dest/
cp src/typescript-javascript/qrcodegen.ts dest/index.ts

npm run build

cp dest/index.js dest/index_esm.js
echo 'export default qrcodegen' >> dest/index_esm.js