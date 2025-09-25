#!/usr/bin/env bash

# Update packeges and mirrors
sudo pacman -Syu
# Download tools and python, C, C++, latex environment, java, java script, rust
sudo pacman -S --needed \
    vim nvim sudo git openssh \
    tmux ripgrep fzf mc okular zip unzip wget less yarn \
    base-devel \
    gcc \
    clang lld libc++ \
    cmake ninja \
    gdb lldb valgrind perf \
    ccache bear \
    pkgconf \
    python python-pip \
    ipython \
    python-pynvim \
    python-pipx \
    texlive-basic texlive-latex texlive-latexextra texlive-latexrecommended \
    texlive-bibtexextra texlive-binextra texlive-context texlive-pictures texlive-metapost texlive-mathscience texlive-formatsextra\
    texlive-fontsextra texlive-fontsrecommended texlive-fontutils \
    texlive-langpolish \
    jdk-openjdk \
    nodejs npm \
    rust

# Installing tools through python uv
pipx ensurepath
pipx install uv
# Ensure uv is visible
source ~/.bashrc
# Install tools through uv
uv tool install mypy 
uv tool install ruff 
uv tool install pre-commit

# Install nvim plug
if [ ! -f "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim ]; then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# Install tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# Usefull git settings
git config --global core.editor nvim
git config --global rebase.autosquash true
git config --global rebase.updateRefs true
git config --global color.ui auto
git config --global format.pretty oneline
git config --global init.defaultBranch main
git config --global branch.autoSetupMerge always
git config --global core.autocrlf input

# Define locations
NVIM_DIR="$HOME/.config"
NVIM_CONFIG="nvim"
NVIM_PATH="$NVIM_DIR/$NVIM_CONFIG"

TMUX_DIR="$HOME"
TMUX_CONFIG=".tmux.conf"
TMUX_PATH="$TMUX_DIR/$TMUX_CONFIG"

# yes/no helper
yes_no() {
    printf "%s [y/N]: " "$1"
    read -r ans
    case "$ans" in
        [Yy]*) return 0 ;;
        *)     return 1 ;;
    esac
}
# Load nvim
if [ -d "$NVIM_PATH" ]; then
    if yes_no "Do you want to remove current nvim config?"; then
        rm -r "$NVIM_PATH"
        cp -r "$NVIM_CONFIG" "$NVIM_DIR"
    fi
else
    cp -r "$NVIM_CONFIG" "$NVIM_DIR"
fi
# Load tmux
if [ -f "$TMUX_PATH" ]; then
    if yes_no "Do you want to remove current tmux config?"; then
        rm "$TMUX_PATH"
        cp "$TMUX_CONFIG" "$TMUX_DIR"
    fi
else
    cp "$TMUX_CONFIG" "$TMUX_DIR"
fi

if yes_no "Do you want to install aditional packages?"; then 
    sudo pacman -S glpk qt6-base qt6-tools
fi


# Decide on the clipboard for nvim integration and uncomment proper line
#
# X11
# sudo pacman -S xclip
#
# Wayland
# sudo pacman -S wl-clipboard
#
# WSL (need to uncomment line in nvim/lua/setup.lua)
# WINCLIP_DIR="winclip"
# wget -P "$WINCLIP_DIR" https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
# unzip "${WINCLIP_DIR}/win32yank-x64.zip" -d "$WINCLIP_DIR"
# chmod +x "${WINCLIP_DIR}/win32yank.exe"
# sudo mv "${WINCLIP_DIR}/win32yank.exe" /usr/local/bin/
# rm -rf "$WINCLIP_DIR"
