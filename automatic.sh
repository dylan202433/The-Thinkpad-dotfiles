yay -S hyprland-git
yay -S ml4w-hyprland
ml4w-hyprland-setup
yay -S waybar rofi dunst kitty swaylock-fancy-git swayidle pamixer light brillo cmake meson cpio pkg-config waypaper hyprpolkitagent && sudo pacman -S python python-pip waybar cliphist swww power-profiles-daemon
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip
sudo pacman -S unzip
unzip JetBrainsMono.zip
unzip Iosevka.zip
mkdir ~/.fonts
cp -r JetBrainsMono ~/.fonts
cp -r Iosevka ~/.fonts
fc-cache -fv
git clone https://github.com/dylan202433/The-Thinkpad-dotfiles.git
cd The-Thinkpad-dotfiles
sudo cp -r ./config/* ~/.config/