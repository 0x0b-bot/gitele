#!/bin/bash

echo "############################################"
WORK_DIR="${1:-.}"

if [[ ! -d "$WORK_DIR" ]]; then
    echo "ERROR_ods2pdf: directory does not exist: $WORK_DIR"
    exit 1
fi

WORK_DIR="$(realpath "$WORK_DIR")"

echo "[INFO] current directory: $WORK_DIR"

echo "--------------------------------------------"

mkdir -p pdf
for file in "$WORK_DIR"/*.odt; do
	if [ -f "$file" ]; then 
        # echo "converting: $file" 
		libreoffice --headless --convert-to pdf --outdir pdf $file
	fi
done

echo "[INFO] conversion complete"
echo "############################################"
