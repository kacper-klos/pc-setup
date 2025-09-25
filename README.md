# pc-setup

Personal **Neovim** and **tmux** setup for Arch Linux (works with WSL too). It was created to allow me to easily recreate my setup after failure.

---

## Pre-installation

If you’re starting from a fresh Arch Linux installation, it’s recommended to first create a non-root user.

### 1. Create a new user

Upgrade all packages:

```bash
pacman -Syu
```

Create a new user and set a password:

```bash
useradd -m -G wheel -s /bin/bash <username>
passwd <username>
```

Install `sudo`:

```bash
pacman -S sudo
```

Set `sudo` permissions:

```bash
pacman -S neovim vim
EDITOR=nvim visudo
```

Uncomment the following line:

```
%wheel ALL=(ALL) ALL
```

#### For WSL users:

If you’re on **WSL**, set the new user as the default one in **PowerShell or CMD**:

```powershell
wsl --manage archlinux --set-default-user <username>
```

### 2. Setup Git

Install Git and OpenSSH:

```bash
sudo pacman -S git openssh
```

Configure Git credentials:

```bash
git config --global user.name "<gitusername>"
git config --global user.email "<gitemail>"
```

### 3. Setup SSH

Create an `.ssh` directory:

```bash
mkdir ~/.ssh
```

Place the file `ssh_start.sh` into `~/.ssh/` and add this line to your `~/.bashrc`:

```bash
source ~/.ssh/ssh_start.sh
```

Run the script and generate or [add](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) your SSH keys.
Make sure private keys are not accessible by other users:

```bash
chmod 600 <sshkey>
```

Check if keys were added properly:

```bash
ssh-add -l
```

If the agent is running but no key is loaded, try adding it manually:

```bash
ssh-add <sshkey>
```

---

## Dependencies

The `install.sh` script installs a full development environment, including:

* **Core tools:** `vim`, `nvim`, `sudo`, `git`, `openssh`, `tmux`, `ripgrep`, `fzf`, `mc`, `zip`, `unzip`, `wget`, `less`, `okular`, `yarn`
* **Build tools:** `base-devel`, `gcc`, `clang`, `lld`, `libc++`, `cmake`, `ninja`, `pkgconf`, `ccache`, `bear`
* **Debugging/profiling:** `gdb`, `lldb`, `valgrind`, `perf`
* **Python:** `python`, `python-pip`, `ipython`, `python-pynvim`, `python-pipx`
* **LaTeX (full environment):** `texlive-basic`, `texlive-latex`, `texlive-latexextra`, `texlive-latexrecommended`, `texlive-bibtexextra`, `texlive-binextra`, `texlive-context`, `texlive-pictures`, `texlive-metapost`, `texlive-mathscience`, `texlive-formatsextra`, `texlive-fontsextra`, `texlive-fontsrecommended`, `texlive-fontutils`, `texlive-langpolish`
* **Languages:**

  * Java: `jdk-openjdk`
  * Node.js / JavaScript: `nodejs`, `npm`
  * Rust: `rust`
* **Python tools (via pipx + uv):** `mypy`, `ruff`, `pre-commit`

Optional extras (installed if you confirm):

* `glpk`, `qt6-base`, `qt6-tools`

Clipboard integration (choose one depending on your environment):

* **X11:** `xclip`
* **Wayland:** `wl-clipboard`
* **WSL (Windows):** `win32yank`

---

## Installation

Clone this repository and run the installer:

```bash
git clone git@github.com:kacper-klos/pc-setup.git
cd pc-setup
./install.sh
```

Optional:

* Open `install.sh` and **uncomment the clipboard integration line** if you want system clipboard support.
* After installation, **restart your shell** for changes to take effect.
