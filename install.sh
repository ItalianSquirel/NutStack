#!/bin/bash

# Check if gum is installed; if not, install via Charm APT repo
if ! command -v gum &> /dev/null; then
  echo "==> Gum not found. Installing via Charm APT repo..."
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
  echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" |     sudo tee /etc/apt/sources.list.d/charm.list > /dev/null
  sudo apt update
  sudo apt install -y gum

  if ! command -v gum &> /dev/null; then
    echo "❌ Gum installation failed. Exiting."
    exit 1
  fi
fi

# Ensure Flatpak is installed
if ! command -v flatpak &> /dev/null; then
  echo "==> Flatpak not found. Installing..."
  sudo apt update
  sudo apt install -y flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Clear old variables
unset apps tools configs

echo "==> Welcome to NutStack! Press the "x" key to select.
mode=$(gum choose --header="Select setup mode:" "Quick Install" "Custom Install" "Exit")

[ "$mode" = "Exit" ] && exit 0
[ "$mode" = "Quick Install" ] && ./presets/quick.sh && exit 0

parse_names() {
  grep -v '^#' "$1" | awk -F '::' '{print $1}' | sed 's/ *$//'
}

apps=$(gum choose --no-limit --header="Choose apps:" $(parse_names installers/app_list.txt))
tools=$(gum choose --no-limit --header="Choose tools:" $(parse_names installers/tool_list.txt))

configs=$(gum choose --header="Apply dotfiles/configs?" "Yes" "No")

gum confirm "Proceed?" && {
  run_installs() {
    local list_file=$1
    shift
    for choice in "$@"; do
      cmd=$(grep "^$choice" "$list_file" | awk -F '::' '{print $2}')
      if [ -n "$cmd" ]; then
        echo "Installing $choice..."
        eval "$cmd"
      else
        echo "No command found for $choice"
      fi
    done
  }

  run_installs installers/app_list.txt $apps
  run_installs installers/tool_list.txt $tools

  [ "$configs" = "Yes" ] && ./installers/configs.sh
}

# Ensure all internal scripts are executable
chmod +x ./presets/*.sh
chmod +x ./installers/*.sh
