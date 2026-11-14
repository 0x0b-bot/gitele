#!/bin/bash

echo "############################################"
FILE_DIR="${1:-.}"
FILE_DEST="${2:-,}"

FILE_DIR="$(realpath "$FILE_DIR")"
FILE_DEST="$(realpath "$FILE_DEST")"

echo "[INFO] current directory: $WORK_DIR"

echo "--------------------------------------------"

mkdir -p pdf
for file in "FILE_DIR"/*.odt; do
	if [ -f "$file" ]; then 
        # echo "converting: $file" 
		libreoffice --headless --convert-to pdf --outdir "$FILE_DEST" "$file"
	fi
done

echo "[INFO] conversion complete"
echo "############################################"
