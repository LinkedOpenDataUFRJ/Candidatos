#!/bin/bash

download_folder=downloads
extract_folder=arquivos
concat_folder=concatenados

mkdir -p "$download_folder"

cd "$download_folder"

curl -O http://agencia.tse.jus.br/estatistica/sead/odsele/consulta_cand/consulta_cand_[1996-2016:2].zip

cd "../"

mkdir -p "$extract_folder"

unzip -d "$extract_folder" "$download_folder""/*.zip" "*.txt"

mkdir -p "$concat_folder"

for ano in {1996..2016..2}; do
    file=$concat_folder/$ano.csv
    find "$extract_folder" -regex ".*$ano.*" -print0 | xargs -0 cat > "$file"
    encoding=`file -b --mime-encoding "$file"`
    mv "$file" "$file.bkp"
    iconv -f "$encoding" -t utf-8 "$file.bkp" > "$file"
    rm "$file.bkp"
    sed -f subs.sed -i "$file"
done


