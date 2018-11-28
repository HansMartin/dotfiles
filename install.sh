#!/bin/bash
# Installation script...

inst_void="vpm "
package_man="apt "

git_path="$HOME/documents/tools"




install_git_pck () {

    base_name=$(echo $1 | awk -F/ '{print $9}')

    # download pkg if not already in the folder
    p=$HOME/documents/pkgs/$base_name
    [ ! -f $p ] && wget $1 -O $HOME/documents/pkgs/$base_name

    if [ $? -eq 0 ]
    then
        # install if everything went ok.
        dpkg -i $HOME/documents/pkgs/$base_name
    fi
}



create_folder_struct () {

    # bin. path & golang
    mkdir -p $HOME/documents/bin
    mkdir -p $HOME/documents/tools
    mkdir -p $HOME/documents/pkgs
    mkdir -p $HOME/documents/golang
    mkdir -p $HOME/pictures
    mkdir -p $HOME/.config/i3

    # add vim folders
    mkdir -p $HOME/.vim/autoload
    mkdir -p $HOME/.vim/backups
    mkdir -p $HOME/.vim/undo

    # vim plugin manager
    p=$HOME/.vim/autoload/plug.vim
    [ ! -f $p ] && cp $(pwd)/vim/autoload/plug.vim $p

    # wallpaper
    p=$HOME/pictures/wallpaper
    [ ! -d $p ] && cp -r $(pwd)/wallpaper $p

    # scrips folder
    p=$HOME/scripts
    [ ! -d $p ] && cp -r $(pwd)/scripts $p

    # urxvt extension folder
    mkdir -p $HOME/.urxvt/ext

    # download font-size extension
    p=$HOME/.urxvt/ext/font-size
    [ ! -f $p ] && wget https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size -O $p

    echo "[+] Created Folder Structure"

}



parse_progs () {
    for i in $(cat progs.csv)
    do
        x=$(echo $i | awk -F, '{print $1}')
        pck=$(echo $i | awk -F, '{print $2}')

        if [ "$x" = "g" ]
        then
            echo "[*] cloning Github repo [$pck]...."
            clone_repo $pck
        elif [ "$x" = "p" ]
        then
            echo "[*] installing $pck via package manager"
            install_via_apt $pck
        elif [ "$x" = "d" ]
        then
            echo "[*] installing .deb package from github"
            install_git_pck $pck
        fi
    done
}


install_via_apt() {
    # installs $1 via package manager
    ($package_man install $1 --yes)
}


clone_repo() {
    # clones github repo in $1 to default git_path variable
    (cd $git_path && git clone -q $1 2> /dev/null)
}

check_conn() {
    wget -q --spider http://google.com

    if [ $? -eq 0 ]; then
        echo "[*] Got internet connection"
    else
        echo "[-] No internet connection. aborting."
        exit
    fi
}

update_pm() {
    echo "[*] Updating package manager"
    ($package_man update)
}


# link all dotfiles to the home folder
link_dots () {
    ln -s $(pwd)/bash/bashrc $HOME/.bashrc 2> /dev/null
    ln -s $(pwd)/bash/bash_aliases $HOME/.bash_aliases 2> /dev/null
    ln -s $(pwd)/vim/vimrc $HOME/.vimrc 2> /dev/null
    ln -s $(pwd)/home/Xresources $HOME/.Xresources 2> /dev/null
    ln -s $(pwd)/i3/config $HOME/.config/i3/config 2> /dev/null
    ln -s $(pwd)/tmux/tmux.conf $HOME/.tmux.confg 2> /dev/null

}

main () {

    check_conn
    update_pm
    create_folder_struct
    parse_progs
    link_dots

    # more settings
    setxkbmap us        # keyboard layout - just in case

}


# run installer
main


