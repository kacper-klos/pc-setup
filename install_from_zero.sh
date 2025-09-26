# Update packages
sudo pacman -Syu
# Download os gui
sudo pacman -S --needed \
    i3-wm i3status i3lock dmenu xorg-xinit xterm \
    feh rofi polybar \
    sddm \
    nvidia nvidia-utils nvidia-settings \
    kitty 
# Start using sddm to login
sudo systemctl enable sddm.service
# Update initramfs
sudo mkinitcpio -P
