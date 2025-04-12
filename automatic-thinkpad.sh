#!/bin/bash

# Install Hyprland based on distro
if command -v yay &> /dev/null; then
    echo "Installing Hyprland via yay..."
    yay -S --noconfirm hyprland-git ml4w-hyprland
else
    echo "Installing Hyprland via sudo pacman..."
    sudo pacman -S --noconfirm hyprland
fi

# Warning message before setting up ML4W
echo -e "\n WARNING"
echo "When ML4W asks 'Do you want to restart?' make sure you say *NO*"
echo "I'll wait for 10 seconds to make sure you saw this"
sleep 10

echo -e "\n ⚠️  WARNING :3"
echo "The next step needs to be run manually"
echo "Please run this command *yourself* in a new terminal: ml4w-hyprland-setup"
echo -e "\nI'll pause here and wait for you to do it~ then press enter to continue~ "
read -r

# Install base setups
echo "Installing base packages..."
yay -S --noconfirm waybar rofi dunst kitty swaylock-fancy-git swayidle pamixer light brillo cmake meson cpio pkg-config waypaper hyprpolkitagent yt-x-git
sudo pacman -S --noconfirm python python-pip python-pywal waybar cliphist swww power-profiles-daemon

# Download and install required fonts
echo "Installing required fonts..."
yay -S --noconfirm ttf-font-awesome

mkdir -p ~/.local/share/fonts/JetBrainsMono
mkdir -p ~/.local/share/fonts/Iosevka

curl -L -o ~/.local/share/fonts/JetBrainsMono/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
curl -L -o ~/.local/share/fonts/Iosevka/Iosevka.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip

echo "Unzipping fonts"
unzip ~/.local/share/fonts/JetBrainsMono/JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
unzip ~/.local/share/fonts/Iosevka/Iosevka.zip -d ~/.local/share/fonts/Iosevka

rm ~/.local/share/fonts/JetBrainsMono/JetBrainsMono.zip
rm ~/.local/share/fonts/Iosevka/Iosevka.zip

fc-cache -fv

# Clone and copy dotfiles
echo "Cloning and copying the dotfiles..."
git clone https://github.com/dylan202433/The-Thinkpad-dotfiles.git ~/The-Thinkpad-dotfiles
cd ~/The-Thinkpad-dotfiles
cp -r ./config/* ~/.config/

read -p "Do you want to restart now? (y/N): " restart_choice

if [[ "$restart_choice" =~ ^[Yy]$ ]]; then
    echo "Rebooting now"
    reboot
else
    echo "ok"
fi
