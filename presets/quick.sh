#!/bin/bash
echo "==> Quick installing default tools and apps..."

sudo apt install -y ulauncher htop neofetch
flatpak install -y flathub org.inkscape.Inkscape
flatpak install -y flathub org.gimp.GIMP
flatpak install -y flathub com.bambu.studio
flatpak install -y flathub com.spotify.Client
flatpak install -y flathub org.videolan.VLC
sudo apt install -y imagemagick
sudo apt install -y rpi-imager
sudo apt install -y qbittorrent
sudo apt install -y filezilla
flatpak install -y flathub com.usebottles.bottles
flatpak install -y flathub org.blender.Blender
flatpak install -y flathub org.notepadqq.Notepadqq
sudo apt install -y gparted
flatpak run org.localsend.localsend_app
flatpak run io.github.CyberTimon.RapidRAW
flatpak run io.github.milkshiift.GoofCord
flatpak install flathub net.waterfox.waterfox

echo "==> Quick Install Complete!"
