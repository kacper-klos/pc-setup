#!/usr/bin/env bash

# Update packeges and mirrors
sudo pacman -Syu
# Download tools and python, C, C++, latex environment
sudo pacman -S --needed \
    tmux ripgrep fzf mc okular\
    base-devel \
    gcc \
    clang lld libc++ \
    cmake ninja \
    gdb lldb valgrind perf \
    ccache bear \
    pkgconf \
    python python-pip \
    ipython \
    python-pipx \
    texlive-basic texlive-latex texlive-latexextra texlive-latexrecommended \
    texlive-bibtexextra texlive-binextra texlive-context texlive-pictures texlive-metapost texlive-mathscience texlive-formatsextra\
    texlive-fontsextra texlive-fontsrecommended texlive-fontutils \
    texlive-langpolish

# Installing tools through python uv
pipx ensurepath
pipx install uv
source ~/.bashrc
uv tool install pre-commit
