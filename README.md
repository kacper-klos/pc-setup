# pc-setup
Personal nvim and tmux setup for arch linux

## Pre install
If you start as a root it is safe to first create an account, so not to run as a root. 
### Making a new user
Start by upgrading all packages
```bash
pacman -Syu
```
Then make a new user
```bash
useradd -m -G wheel -s /bin/bash <username>
passwd <username>
```
Then download sudo
```bash
pacman -S sudo
```
And run this command with your favorite text editor
```bash
pacman -S neovim vim
EDITOR=nvim visudo
```
And find line and uncomment it
```
%wheel ALL=(ALL) ALL
```

If you use wsl you may also set this user as a main one (in powershell or cmd)
```powershell
wsl --manage archlinux --set-default-user <username> 
```

### Setuping git
Download packages
```bash
sudo pacman -S git openssh
```
Update credentials
```bash
git config --global user.name <gitusername>
git config --global user.email <gitemail>
```
Set default editot
```bash
git config --global core.editor nvim
```
