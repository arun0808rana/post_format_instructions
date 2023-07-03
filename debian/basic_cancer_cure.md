# Cant install anything

If you can't install anything, having msgs such as `no installation candidate` or unable to install pacakges which were easily installable on ubuntu, then check your source.list file. Its located in /etc/apt/source.list. Chances are its empty or set to some cd-rom cancer.

There is a copy of your distribution in /usr/share/doc/apt/examples/sources.list. Copy from it and paste inside /etc/apt/sources.list

idk if it helps, but reinstall apt -   sudo apt-get install --reinstall apt

sudo apt update && sudo apt upgrade

# CD ROM Cancer

comment the line that looks like `deb cdrom:[Debian GNU/Linu` in `/etc/apt/sources.list`

```bash
nano /etc/apt/sources.list
```

# SUDO Cancer

```bash
su root
nano /etc/sudoers
```

...rest of the code  
\# User privilege specification  
root ALL=(ALL:ALL) ALL  
Paste -------------here---------  
your_username ALL=(ALL:ALL) ALL  
...rest of the code  

ctrl+x to save and exit
