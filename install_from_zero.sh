# Update packages
sudo pacman -Syu
# Download os gui
sudo pacman -S --needed \
    feh rofi polybar \
    sddm \
    nvidia nvidia-utils nvidia-settings \
    kitty \
    geeqie \
    qotf-codenewroman-nerd

# Set proper keyboard
sudo localectl set-x11-keymap pl
sudo localectl set-keymap pl

