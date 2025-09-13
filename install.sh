#!/usr/bin/env bash

# Update packeges and mirrors
sudo pacman -Syu
# Download tools and python, C, C++, latex environment, java, java script, rust
sudo pacman -S --needed \
    tmux ripgrep fzf mc okular zip unzip\
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
