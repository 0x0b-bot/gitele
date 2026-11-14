mkdir -p pdf
for f in *.ods; do
    libreoffice --headless --convert-to pdf --outdir pdf "$f"
done

git add .
git commit -m "zapiski: updated"
git push origin main 

