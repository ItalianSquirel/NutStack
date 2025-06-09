#!/bin/bash
echo "==> Quick installing default tools and apps..."

sudo apt install -y firefox x11-utils ulauncher htop neofetch gnome-tweaks curl git
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub com.visualstudio.code

echo "==> Quick Install Complete!"
