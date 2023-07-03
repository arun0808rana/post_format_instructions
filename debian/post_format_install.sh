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
sudo apt install -y lsd
sudo apt install -y bat
mkdir ~/.themes
mkdir ~/.icons
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install -y brave-browser
sudo apt install -y git
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update -y && sudo apt install -y codium

curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - &&\
apt-get install -y nodejs
sudo npm install --global yarn

echo -e "\n# this needs to be at the end\neval \$(thefuck --alias fuck)" >> ~/.bashrc

curl -sS https://starship.rs/install.sh | sh

mkdir -p ~/.config && touch ~/.config/starship.toml

cat <<EOF > ~/.config/starship.toml
# Get editor completions based on the config schema
"\$schema" = 'https://starship.rs/config-schema.json'

# Inserts a blank line between shell prompts
# add_newline = true

# Replace the '❯' symbol in the prompt with '➜'
[character] # The name of the module we are configuring is 'character'
success_symbol = '[➜](bold green)' # The 'success_symbol' segment is being set to '➜' with the color 'bold green'
error_symbol = '[✗](bold red)' # The 'error_symbol' segment is being set to '✗' with the color 'bold red'

[directory]
style = '#3e73d0'
EOF

echo -e "\n\n# this needs to be at the end\neval \"\$(starship init bash)\"" >> ~/.bashrc




















