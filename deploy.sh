#!/bin/bash
# Deploy script: Mirrors AEM site and flattens for GitHub Pages
# Usage: bash deploy.sh
# Prerequisite: AEM local server running on localhost:8080

WGET="C:\Users\aakas\AppData\Local\Microsoft\WinGet\Packages\JernejSimoncic.Wget_Microsoft.Winget.Source_8wekyb3d8bbwe\wget.exe"
ROOT="C:\Users\aakas\OneDrive\Desktop\Static portfolio"
MIRROR="$ROOT/localhost+8080"
URL="http://localhost:8080/content/aakash-portfolio/home.html"

echo "=== Step 1: Cleaning old files ==="
rm -rf "$ROOT/css" "$ROOT/js" "$ROOT/images" "$ROOT/icons" "$ROOT/documents" "$ROOT/index.html" "$MIRROR"

echo "=== Step 2: Mirroring from AEM ==="
"$WGET" --mirror --convert-links --adjust-extension --page-requisites --no-parent -P "$ROOT" "$URL"

echo "=== Step 3: Flattening to GitHub Pages structure ==="
mkdir -p "$ROOT/css" "$ROOT/js" "$ROOT/images" "$ROOT/icons" "$ROOT/documents"
cp "$MIRROR/apps/aakash-portfolio/clientlibs/clientlib-site/css/"* "$ROOT/css/"
cp "$MIRROR/apps/aakash-portfolio/clientlibs/clientlib-site/js/"* "$ROOT/js/" 2>/dev/null
cp "$MIRROR/content/aakash-portfolio/assets/images/"* "$ROOT/images/"
cp "$MIRROR/content/aakash-portfolio/assets/icons/"* "$ROOT/icons/"
cp "$MIRROR/content/aakash-portfolio/assets/documents/"* "$ROOT/documents/" 2>/dev/null
cp "$MIRROR/content/aakash-portfolio/home.html" "$ROOT/index.html"

echo "=== Step 4: Fixing paths in index.html ==="
sed -i 's|../../apps/aakash-portfolio/clientlibs/clientlib-site/css/|css/|g' "$ROOT/index.html"
sed -i 's|../../apps/aakash-portfolio/clientlibs/clientlib-site/js/|js/|g' "$ROOT/index.html"
sed -i 's|assets/images/|images/|g' "$ROOT/index.html"
sed -i 's|assets/icons/|icons/|g' "$ROOT/index.html"
sed -i 's|assets/documents/|documents/|g' "$ROOT/index.html"
sed -i 's|home\.html|index.html|g' "$ROOT/index.html"

echo "=== Step 5: Cleanup ==="
rm -rf "$MIRROR"

echo ""
echo "Done! Your site is ready for GitHub Pages."
echo "Structure:"
echo "  index.html"
echo "  css/"
echo "  js/"
echo "  images/"
echo "  icons/"
echo "  documents/"
echo "  README.md"
