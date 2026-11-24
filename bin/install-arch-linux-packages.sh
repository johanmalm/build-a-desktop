#!/usr/bin/env bash

packages=(
##! [0]
  labwc-themes
  labwc-tweaks
  labwc-menu-generator

  swaybg
  swaylock
  swayidle
  foot
  wtype
  wlr-randr            # manage outputs (monitors)
  slurp
  grim                 # take screenshots
  wf-recorder
  wl-clipboard

  rofi                 # application launcher
  mc

  kvantum              # set Qt theme
  qt6ct                # set Qt theme

  ttf-dejavu
  papirus-icon-theme   # Papirus icons
  gnome-themes-extra   # Neede to enable Adwaita-dark

  git
  man
  gcc
  pkg-config
  gnome-keyring
  bash-completion

  lximage-qt           # LXQt image viewer
  featherpad           # LXQt text editor
  pcmanfm-qt           # LXQt file manager

  gnome-text-editor    # Gtk4 test client
  mousepad             # Gtk3 test client
  thunar               # Gtk3 test client
##! [0]
)

sudo pacman -S "${packages[@]}"
