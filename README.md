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

### Setuping ssh
Create .ssh dir
```bash
mkdir ~/.ssh
```
Add the file `ssh_start.sh` into `.ssh` foler and add this to `.bashrc`
```bash
source ~/.ssh/ssh_start.sh
```
Then you can run the script and add or create ssh keys. Remember private keys should not be publicly seen by other users, you should run
```bash
chmod 600 <sshkey>
```
After all check if keys were added properly
```bash
ssh-add -l
```
If the agent is running but there is no key try add it manualy and resolve the error
```bash
ssh-add <sshkey>
```

## Instalation
It is sufficient that you run
```bash
git clone git@github.com:kacper-klos/pc-setup.git
cd pc-setup
./install.sh
```
You may also look into the `install.sh` and uncomment line for clipboard integration. 
After that you should restart shell and everything should be working as expected.
