#!/bin/bash
echo "==> Installing OrcaSlicer (AppImage)..."

# Define version and URL
VERSION="2.0.0"
FILENAME="OrcaSlicer-${VERSION}-linux-x86_64.AppImage"
URL="https://github.com/SoftFever/OrcaSlicer/releases/download/${VERSION}/${FILENAME}"

# Download and install
mkdir -p ~/Applications
wget -q --show-progress "$URL" -O ~/Applications/OrcaSlicer.AppImage
chmod +x ~/Applications/OrcaSlicer.AppImage

# Create .desktop file
mkdir -p ~/.local/share/applications
cat <<EOF > ~/.local/share/applications/orcaslicer.desktop
[Desktop Entry]
Name=OrcaSlicer
Exec=\$HOME/Applications/OrcaSlicer.AppImage
Icon=utilities-terminal
Type=Application
Categories=Graphics;3DGraphics;
EOF

echo "✅ OrcaSlicer installed in ~/Applications and added to your menu."
