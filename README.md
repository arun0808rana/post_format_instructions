# Post Format Instructions

### Fix nvidia proprietary driver crap (shutdown bug)

- search for driver or software
- open `Additional Drivers`
- choose the `proprietary and tested` option from driver list
- RESTART

### Update packages list

```bash
sudo apt update
```

### Upgrade the installed packages

```bash
sudo apt upgrade
```

### Curl

```bash
sudo apt install curl
```

### Autojump

```bash
sudo apt install autojump
```

Add the following in your .bashrc and source .bashrc after that

```bash
[[ -s /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh
```

### Neovim

- goto https://github.com/neovim/neovim/releases
- make sure its not nightly or pre-release. maybe latest
- choose the tar.gz file
- untar it and move it to /usr/bin/nvim if nvchad repo demands it. like in debian due to old versioning


```bash
tar xzvf nvim-linux64.tar.gz
sudo mv ./nvim-linux64/bin/nvim /usr/bin/nvim
nvim -v
```

### Clam AV

```bash
sudo apt update
sudo apt install clamav clamtk clamav-daemon
# sudo systemctl stop clamav-freshclam # else clam av locks the system files while updating
# sudo freshclam # update
# sudo systemctl start clamav-freshclam # starting the clam av service
```

### lsd

```bash
sudo apt install lsd
```

add this to .bashrc for removing green highlight from dirs during lsd output

```bash
export LS_COLORS+=':ow=01;33'
```

### batcat

```bash
sudo apt install bat
```

### Aliases

- Paste .bash_aliases file from this repo into the ~


### Context Menus

```bash
sudo apt-get install filemanager-actions nautilus-actions
```

- Open fma-config-tool

```bash
fma-config-tool
```

* For codium
* Create a new action. Find the damn plust icon or something that says to define a new action. Rename it like `Open with codium` by double clicking the name.
* Tick `display icon in location context menu`
* In the command tab, use `/usr/bin/codium` as path & `%F` as `parameters`
* Save it
* Restart nautilus by `nautilus -q` command.

For more info refer: https://askubuntu.com/questions/1138673/is-filemanager-actions-working-with-19-04/1138682#1138682

### TLDR

```bash
sudo apt install tldr
```

### Fuck

```bash
sudo apt install thefuck
```
- Paste this in .bashrc

```bash
eval $(thefuck --alias fuck)
```


### Xclip for pwd copy alias

```bash
sudo apt install xclip
```

### Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```
- If starship asks you, then add the following line to the end of your .bashrc
  
```bash
eval "$(starship init bash)"
```

- For icons and fonts, download `Noto Nerd Font` from https://www.nerdfonts.com/font-downloads
```bash
mkdir ~/.fonts
```
- Extract the noto font to ~/.fonts dir

### Starship config

- Make a starship.toml file in .config dir:

```bash
mkdir -p ~/.config && touch ~/.config/starship.toml
```
- Add the following code to `starship.toml`
  
```toml
# Get editor completions based on the config schema
"$schema" = 'https://starship.rs/config-schema.json'

# Inserts a blank line between shell prompts
# add_newline = true

# Replace the '❯' symbol in the prompt with '➜'
[character] # The name of the module we are configuring is 'character'
success_symbol = '[➜](bold green)' # The 'success_symbol' segment is being set to '➜' with the color 'bold green'
error_symbol = '[✗](bold red)' # The 'error_symbol' segment is being set to '✗' with the color 'bold red'

[directory]
style = '#3e73d0'
```

### Fzf

```bash
sudo apt install fzf
```

### General apt commands

- Remove package

```bash
sudo apt remove package
```

- Remove any remaining configuration files for package

```bash
sudo apt purge package
```

- Clear package cache
- If some package installtion poses some installation bugs/errors


```bash
sudo apt clean
```

### VLC

```bash
sudo apt install vlc
```

### Tor

1. Extract the tor zip
2. `chmod +x start-tor-browser`
3. Move the `start-tor-browser.desktop` file to `/usr/share/applications`.
4. `sudo mv start-tor-browser.desktop /usr/share/applications/tor.desktop`.
5. `tor.desktop` will be the new name. Now you can search it through apps and add it as favourates to ubuntu dash(sidebar).


### Themeing

#### Gnome-Tweaks

```bash
sudo apt install gnome-tweaks
```

#### Create .themes & .icons dirs for themes & icons

```bash
mkdir ~/.themes
mkdir ~/.icons
```
- Download the bordered-legacy-buttons variant of the guvbox theme from https://www.gnome-look.org/p/1681313.
- Extract the zip inside .themes
- Download zip of this gruvbox-icon repo https://github.com/jkehler/gruvbox-icons.
- Extract the zip inside .icons
- use gnome-tweaks > appearance to change icons & themes



### Brave Browser

```bash
sudo apt install curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser
```


### Nix

Official website download or script

```bash
sh <(curl -L https://nixos.org/nix/install) --daemon
```


### Nodejs

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs
```

### Yarn

```bash
npm install --global yarn
```

### GIT

```bash
nix-env -iA nixpkgs.git
```

- `sudo apt install git`
- verfiy `git -v`

### Libre Wolf

```bash
nix-env -iA nixpkgs.librewolf
```

### VS Codium

```bash
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium
```

or using `nix`

```bash
nix-env -iA nixpkgs.vscodium
```


#### Extension related

> Export/Import preferences config file.

##### Codium 
- `codium --list-extensions`

##### vscode

- `code --list-extensions` lists currently installed extensions.
- Put all your generated names in the file `vscode_instructions/vscode_instr.txt`.
- `vscode_instructions/vscode_instr.txt` consists of full name of vs code extensions. These names wil be used for installing them sequencially.
- Run node index.js to install this script.
```bash
node index.js
```

### vs-code alt+{i,j,k,l} for arrow keys binding setup

- Install `xbindkeys` and `xvkbd`.

```bash
sudo apt install xbindkeys
sudo apt install xvkbd
```
- Generate xbindkeysrc in home

```bash
xbindkeys --defaults > ~/.xbindkeysrc
```

- Add the following in the xbindkeysrc file. Its hidden so ls -al in the root dir.

```bash
"xvkbd -xsendevent -text '\[Left]'"
m:0x18 + c:44
alt + j

"xvkbd -xsendevent -text '\[Down]'"
m:0x18 + c:45
alt + k

"xvkbd -xsendevent -text '\[Right]'"
m:0x18 + c:46
alt + l

"xvkbd -xsendevent -text '\[Up]'"
m:0x18 + c:31
alt + i
```
### QEMU
- Note: Enable virtulalization in your BIOS settings
- https://christitus.com/vm-setup-in-linux/

### Volumes commands

```bash
amixer -D pulse sset Master unmute 5%+
```

```bash
amixer -D pulse sset Master unmute 5%-
```

- todo: add hotkeys for the above.




