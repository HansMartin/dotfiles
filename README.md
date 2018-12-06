# Dotfiles


## Installation

Use the progs.csv file as source for packages, github repos, github .deb files (Idea stolen from Luke Smith)

__Format:__

[p|d|g],[pkg name|repo|deb path]


Adjust the symlinks in the installer script and run the installer.
```sh
./install.sh
```


This copies every file in the right place and installs all the specified packages

### Tools
* WM: i3-gaps
* Terminal: urxvt
* Editor: vim
* File Browser: ranger
* PDF Viewer: zathura
* Images: feh


### More random tools
* i3blocks
* htop
* bat
* fd
* ripgrep
* xautolock
* xbacklight
* rofi
* tmux
* neofetch
* scrot
