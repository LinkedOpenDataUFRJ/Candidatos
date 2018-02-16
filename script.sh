#!/bin/bash

# Variáveis que definem os diretórios
download_folder=downloads
extract_folder=arquivos
concat_folder=concatenados

mkdir -p "$download_folder"

cd "$download_folder"

# Faz o download dos dados
curl -O http://agencia.tse.jus.br/estatistica/sead/odsele/consulta_cand/consulta_cand_[1996-2016:2].zip

cd "../"

mkdir -p "$extract_folder"

# Extrai os dados dos arquivos compactados 
unzip -d "$extract_folder" "$download_folder""/*.zip" "*.txt"

mkdir -p "$concat_folder"

for ano in {1996..2016..2}; do
    file=$concat_folder/$ano.csv
    # Concatena todos os arquivos de determinado ano
    find "$extract_folder" -regex ".*$ano.*" -print0 | xargs -0 cat > "$file"
    # Identifica qual a codificação original
    encoding=`file -b --mime-encoding "$file"`
    mv "$file" "$file.bkp"
    # Converte o arquivo concatenado para UTF-8 para evitar problemas com acentuação
    iconv -f "$encoding" -t utf-8 "$file.bkp" > "$file"
    rm "$file.bkp"
    # Faz pequenas correções nos dados
    sed -r -f subs.sed -i "$file"
done


