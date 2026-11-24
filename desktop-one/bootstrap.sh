#!/usr/bin/env bash

##! [0]
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
##! [0]

##![1]
kvantummanager --set KvGnomeDark
##![1]
