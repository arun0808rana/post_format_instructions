# Post Format Instructions
### curl
`sudo apt install curl`

### Nodejs

#### Using Nix
- `nix-env -iA nixpkgs.nodejs`
or from official website using curl

- `sudo apt install curl`
- Go to https://github.com/nodesource/distributions/blob/master/README.md#debinstall
- choose the lts version
- verify `node -v`
- verify `npm -v`

### yarn

`npm install --global yarn`

### VS Codium

#### Using Nix
- `nix-env -iA nixpkgs.vscodium`

#### extension related

> Export/Import preferences config file.

##### codium 
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


### GIT

- `sudo apt install git`
- verfiy `git -v`


