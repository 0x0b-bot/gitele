#!/bin/bash

echo "############################################"

ODT_DIR="$(cd "$1" && pwd)"
PDF_DEST_DIR="$(mkdir -p "$2" && cd "$2" && pwd)"

echo "[INFO] SOURCE DIR (odt directory): $ODT_DIR"
echo "[INFO] (DESTINATION DIR) (pdf directory): $PDF_DEST_DIR"

echo "--------------------------------------------"

# OS detection
case "$(uname -s)" in
	Linux*)
		echo "[INFO] Detected Linux"
		LO_CMD="libreoffice"
		;;
	MINGW*|MSYS*|CYGWIN*)
		echo "[INFO] Detected Windows (Git Bash)"
		LO_CMD="cmd.exe //c libreoffice"
		;;
	*)
		echo "[ERROR] Unsupported operating system"
		exit 1
		;;
esac
echo "############################################"


mkdir -p pdf
for file in "$ODT_DIR"/*.odt; do
	if [ -f "$file" ]; then 
		echo "converting: $file" 
		# libreoffice --headless --convert-to pdf --outdir "$PDF_DEST_DIR" "$file"
		$LO_CMD --headless --convert-to pdf --outdir "$PDF_DEST_DIR" "$file"
	fi
done

echo "[INFO] conversion complete"
echo "############################################"
	