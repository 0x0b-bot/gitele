#!/bin/bash

echo "############################################"

ODT_DIR="$(realpath "$1")"
PDF_DEST_DIR="$(realpath "$2")"

echo "[INFO] ODT DIR: $ODT_DIR"
echo "[INFO] PDF DEST DIR: $PDF_DEST_DIR"

echo "--------------------------------------------"

mkdir -p pdf
for file in "$ODT_DIR"/*.odt; do
	if [ -f "$file" ]; then 
        # echo "converting: $file" 
		libreoffice --headless --convert-to pdf --outdir "$PDF_DEST_DIR" "$file"
	fi
done

echo "[INFO] conversion complete"
echo "############################################"
