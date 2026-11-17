#!/bin/bash

bash odt2pdf.bash odt pdf

echo "--------------------------------------------"
echo "[INFO] Committing changes..."

git add .
git commit -m "zapiski: updated"
git push origin main

echo "############################################"
echo "[INFO] All tasks completed!"
