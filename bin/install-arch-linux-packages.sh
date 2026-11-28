#!/usr/bin/env bash

packages=(
##! [0]
  labwc-themes          # themes for graphics like titlebar and window-swticher
  labwc-tweaks          # compositor configuration GUI tool
  labwc-menu-generator  # helper for labwc root-menu

  swaybg                # wallpaper setter
  swaylock              # screen locker
  swayidle              # idle manager for screensaver and power management
  foot                  # terminal
  wtype                 # keyboard input simulator (like xdotool)
  wlr-randr             # manage outputs (monitors)
  grim                  # screen shooter
  slurp                 # tool to select screen region
  wf-recorder           # screen recorder
  wl-clipboard          # clipboard tools like wl-copy

  wmenu                 # simple application launcher
  rofi                  # advanced application launcher
  xfce4-panel           # Xfce panel

  kvantum               # set Qt theme
  qt6ct                 # set Qt theme

  ttf-dejavu            # font
  papirus-icon-theme    # icon theme
  gnome-themes-extra    # needed to enable Adwaita-dark

  git
  man
  gcc
  pkg-config
  gnome-keyring
  bash-completion
  mc
  pandoc

  lximage-qt            # LXQt image viewer
  featherpad            # LXQt text editor
  pcmanfm-qt            # LXQt file manager

  gnome-text-editor     # Gtk4 test client
  mousepad              # Gtk3 test client
  thunar                # Gtk3 test client
##! [0]
)

sudo pacman -S "${packages[@]}"
