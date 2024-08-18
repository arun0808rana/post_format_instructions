#!/bin/bash

sudo apt update
sudo apt upgrade -y
sudo apt install -y nvidia-driver firmware-misc-nonfree
sudo apt install -y curl
sudo apt install -y tldr
sudo apt install -y thefuck
sudo apt install -y xclip
sudo apt install -y fzf
sudo apt install -y vlc
sudo apt install -y gnome-tweaks
sudo apt install -y exa
sudo apt install -y bat
sudo apt install -y git
sudo apt install -y deluge
sudo apt install -y libnotify-bin
sudo apt install -y autojump
sudo apt install -y nnn
sudo apt install -y which
sudo apt install -y trash-cli
sudo apt install -y xinput
sudo apt install -y htop
sudo apt install -y foliate
sudo apt install -y alsa-utils
sudo apt install -y sxhkd
sudo apt install -y kwrite
sudo apt install -y alacritty
sudo apt install -y libsixel-bin
sudo apt install -y neofetch
sudo apt install -v flatpak

echo '-------------------Adding flatpak repo source---------------------'
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo '-----------------Installing WEZTERM-----------------------'
flatpak install flathub org.wezfurlong.wezterm

echo '-------------------GTK Theming---------------------------'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
# super+d to show desktop
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"

echo '--------------Removing default workspace bindings----------------'
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['']"


echo '----------------initializing sxhkd hotkeys---------------'
mkdir -p ~/.config/sxhkd
touch ~/.config/sxhkd/sxhkdrc

echo '--------------Adding weights to autojump db-----------------------'
j -a ~/dev_profile/pro -i 10
j -a ~/dev_profile/Downloads -i 10
j -a ~/dev_profile -i 10


echo '--------------Making .themes and .icons directories----------------'
mkdir "/home/$USER/.themes"
mkdir "/home/$USER/.icons"

echo '-------------Installing Brave Browser-----------------'
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install -y brave-browser

echo '-------------Installing Codium-----------------'
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update -y && sudo apt install -y codium

echo '-------------Installing Nodejs-----------------'
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - &&\
sudo apt-get install -y nodejs

echo '-------------Installing Yarn-----------------'
sudo npm install --global yarn

echo '----------theFuck Integration in .bashrc file---------------'
echo -e "\n# this needs to be at the end\neval \$(thefuck --alias fuck)" >> "/home/$USER/.bashrc"

echo '------------Making .config dir in root and creating starship.toml inside it--------------'
mkdir -p "/home/$USER/.config"
touch "/home/$USER/.config/starship.toml"

echo '-----------------------------alacritty theming-------------------------------'
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes


echo '---------starship integration in .bashrc----------------'
echo -e "\n\n# this needs to be at the end\neval \"\$(starship init bash)\"" >> "/home/$USER/.bashrc"

echo '-------------Installing starship-----------------'
curl -sS https://starship.rs/install.sh | sh

echo '----------------starship preseting a presset to starship.toml file----------------'
touch ~/.config/starship.toml
starship preset nerd-font-symbols -o ~/.config/starship.toml

echo '----------------Installing nix-----------------'
sh <(curl -L https://nixos.org/nix/install) --daemon

source "/home/$USER/.bashrc"

echo '--------------Installing NIX Packages-----------------'
# The command you want to execute in the new Bash session
nix_packages="nix-env -iA nixpkgs.monolith nixpkgs.dotenv-linter"

# Check if gnome-terminal is installed (you can replace this with your terminal emulator)
if command -v gnome-terminal &>/dev/null; then
    # Open a new gnome-terminal window with the specified command
    gnome-terminal -- bash -c "$nix_packages; exec bash"
fi

echo '-----------Installing Insomnia-----------------'
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

sudo apt update
sudo apt install -y insomnia

sudo curl -JL -o /usr/bin/nvim https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x /usr/bin/nvim
nvim

source "/home/$USER/.bashrc"
