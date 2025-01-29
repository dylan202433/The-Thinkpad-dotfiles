![Alt Text](hyprland.png)
dotfile for thinkpads based on ml4w and dylan202433 dotfiles
Installation guide 
First Install Hyprland depend on what distro you use
```zsh
yay -S hyprland-git #sudo pacman -S hyprland
```
Now install the ML4W dotfiles
```zsh
yay -S ml4w-hyprland
ml4w-hyprland-setup
```
Install the base setups
```zsh
yay -S waybar rofi dunst kitty swaylock-fancy-git swayidle pamixer light brillo cmake meson cpio pkg-config waypaper hyprpolkitagent && sudo pacman -S python python-pip waybar cliphist swww power-profiles-daemon
```
Required Fonts

https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip

https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip
```zsh
yay -S ttf-font-awesome
```
Once you download them and unpack them, place them into ~/.fonts or ~/.local/share/fonts.

Then run this command for your system to detect the newly installed fonts.
```zsh
fc-cache -fv
```
Now copy the dotfile
```zsh
git clone https://github.com/dylan202433/The-Thinkpad-dotfiles.git
cd The-Thinkpad-dotfiles
cp -r ./config/* ~/.config/
```
If there any error pls report in the issues
