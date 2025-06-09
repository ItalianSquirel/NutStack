# 🐿️ NUTSTACK

**NUTSTACK** is a modular and interactive setup script to quickly install your favorite tools, apps, and configs on a fresh Linux machine, like a squirrel caching the essentials.

---

## 📦 Features

- ✅ Interactive terminal UI with [gum](https://github.com/charmbracelet/gum)
- ✅ Quick install mode for your default setup
- ✅ Custom install mode with app and tool selection
- ✅ Auto-installs `gum` if missing
- ✅ Optional dotfiles/configs application

---

## 🚀 Getting Started

1. Extract the repo:
   ```bash
   unzip bootstrap_clean.zip
   cd bootstrap_clean
   ```

2. Run the installer:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

---

## 🧩 Structure

```
install.sh              # Main interactive script
installers/
  ├── app_list.txt      # List of GUI apps + install commands
  ├── tool_list.txt     # List of CLI tools + install commands
  └── configs.sh        # Optional dotfiles installer
presets/
  └── quick.sh          # Quick install script for your favorites
config/
  └── .bashrc           # Optional dotfiles (if you use any)
```

---

## 📝 Adding Apps or Tools

Edit the `.txt` files using this format:
```
Name of App :: install command
```

Example:
```
Neovim :: sudo apt install -y neovim
```

No need to touch any other script — it's all data-driven.

---

## 🧠 Requirements

- A Debian-based Linux system (like Ubuntu)
- Internet access (unless you're using local `.deb` files)

---

## 🧪 Tested On

- Ubuntu 22.04+
- Pop!_OS 22.04
- Raspberry Pi OS (with APT support)

---

## 📖 License

MIT - customize, extend, or remix as you like!
