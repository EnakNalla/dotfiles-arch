# install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

PACMAN_PACKAGES=(
# desktop
  "hyprland"
  "hypridle"
  "hyprcursor"
  "hyprlock"
  "greetd"
  "hyprpaper"
  "waybar"
  "wofi"
  "wlr-randr"
  "wl-clipboard"
  "swaync"
  "dolphin"
  "brightnessctl"
  "playerctl"
  "blueman"
  "fprintd"

  # sound
  "alsa-utils"
  "pavucontrol"
  "pipewire"
  "pulseaudio"
  "qpwgraph"

  # system utilities
  "lshw"
  "htop"
  "alacritty"
  "git"
  "usbutils"
  "killall"
  "fzf"
  "zip"
  "unzip"
  "ripgrep"
  "file-roller"
  "fd"

  # apps
  "firefox"
  "neovim"
  "feh"
  "linux-firmware"
  "mpv"

  # dev
  "rustup"
  "gcc"
  "lazygit"
)

for i in "${PACMAN_PACKAGES[@]}"; do
  pacman -S $i --noconfirm --needed
done

# setup hyprland
sudo echo "auth include login" >> /etc/pam.d/hyprlock

# setup greetd
sudo cat > /etc/greetd/config.toml <<EOF
[default_session]
user = $(whoami)
command = "hyprland"
EOF

# enable services
sudo systemctl enable --now greetd
sudo systemctl enable --now fprintd
sudo systemctl enable --now pipewire
sudo systemctl enable --now hyperpaper
sudo systemctl enable --now hypridle

AUR_PACKAGES=(
  "visual-studio-code-bin"
)

for i in "${AUR_PACKAGES[@]}"; do
  yay -S $i --noconfirm --needed
done

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

nvm install --lts
