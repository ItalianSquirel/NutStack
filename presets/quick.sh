#!/bin/bash
echo "==> Quick installing default tools and apps..."

sudo apt install -y firefox ulauncher htop neofetch
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub com.visualstudio.code

echo "==> Quick Install Complete!"
