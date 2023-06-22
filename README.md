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

### Clam AV

```bash
sudo apt update
sudo apt install clamav clamtk clamav-daemon
# sudo systemctl stop clamav-freshclam # else clam av locks the system files while updating
# sudo freshclam # update
# sudo systemctl start clamav-freshclam # starting the clam av service
```

### Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```
- If starship asks you, then add this to the end of your .bashrc `eval "$(starship init bash)"`
- For icons and fonts, download `Noto Nerd Font` from https://www.nerdfonts.com/font-downloads
```bash
mkdir ~/.fonts
```
- Extract the noto font to ~/.fonts dir


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

https://christitus.com/vm-setup-in-linux/

### Volumes commands

```bash
amixer -D pulse sset Master unmute 5%+
```

```bash
amixer -D pulse sset Master unmute 5%-
```

- todo: add hotkeys for the above.




