#!/usr/bin/env bash

##! [0]
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

gsettings set org.gnome.desktop.interface font-name 'DejaVu Sans 10'
gsettings set org.gnome.desktop.interface document-font-name 'DejaVu Serif 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'DejaVu Sans Mono 10'

gsettings set org.gnome.desktop.wm.preferences titlebar-font 'DejaVu Sans 10'
##! [0]

##![1]
kvantummanager --set KvGnomeDark
##![1]
