#!/bin/bash

install_packages() {
  # Enable COPR repositories
  dnf copr enable -y dejan/lazygit

  sudo dnf5 update -y

  ## Install basic packages
  sudo dnf5 install -y \
    gimp \
    nautilus \
    vlc \
    openh264 \
    evince \
    obs-studio \
    rofi \
    sway \


  # Install system utilities tools
  sudo dnf5 install -y \
    flatpak \
    jq \
    ripgrep \
    fzf \
    tldr \
    openssl \
    nmap \
    htop \
    xrandr \
    lazygit

  ## Install Keyboard packages
  sudo dnf5 install -y \
    fcitx5 \
    fcitx5-configtool \
    fcitx5-qt \
    fcitx5-unikey \
  
  # ## Insall dependencies packages
  # sudo dnf5 install -y \
  #   gcc \
  #   meson \
  #   ninja-build \
  #   wayland-devel \
  #   mesa-libEGL-devel \
  #   mesa-libGLES-devel \
  #   mesa-dri-drivers \
  #   xorg-x11-server-Xwayland \
  #   libdrm-devel \
  #   libgbm-devel \
  #   libxkbcommon-devel \
  #   libudev-devel \
  #   pixman-devel \
  #   libinput-devel \
  #   libevdev-devel \
  #   systemd-devel \
  #   cairo-devel \
  #   libpcap-devel \
  #   json-c-devel \
  #   pam-devel \
  #   pango-devel \
  #   pcre-devel \
  #   gdk-pixbuf2-devel \
  #   hwdata-devel

  flatpak install flathub io.github.seadve.Kooha

}

install_neovim() {
  sudo dnf5 install -y neovim

  # Install Vim Plug for Neovim
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


init() {
  install_packages
  # install_neovim
}


init
