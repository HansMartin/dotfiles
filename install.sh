#!/bin/bash
# Installation script...

inst_void="vpm "
package_man="apt "

git_path="$HOME/documents/tools"

files='.bashrc .vimrc .bash_aliases .Xresources .radare2rc .tmux.conf'
folders='.config .scripts .vim'


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


    # vim plugin manager
    p=$HOME/.vim/
    [ ! -d $p ] && cp -r $(pwd)/home/.vim/ $HOME

    # .config
    p=$HOME/.config/
    [ ! -d $p ] && cp -r $(pwd)/home/.config/ $HOME

    # wallpaper
    p=$HOME/pictures/
    [ ! -d $p ] && cp -r $(pwd)/home/pictures/  $HOME

    # scrips folder
    p=$HOME/.scripts
    [ ! -d $p ] && cp -r $(pwd)/home/.scripts $HOME

    # urxvt extension folder
    # mkdir -p $HOME/.urxvt/ext ~ currently not needed, using  st

    # download font-size extension
    #p=$HOME/.urxvt/ext/font-size
    #[ ! -f $p ] && wget https://raw.githubusercontent.com/majutsushi/urxvt-font-size/master/font-size -O $p

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


make_backup() {
    # create a dir for all backup files
    mkdir $HOME/.backupdots
    echo "[*] Backing up dotfiles"

    # backup all files
    for f in $files;
    do
        cp $HOME/$f $HOME/.backupdots/
    done

    # backup all directories
    for d in $folders;
    do
        cp -r $HOME/$d $HOME/.backupdots
    done

}

copy_dots() {
    echo "[*] copy new dotfiles"

    # copy files
    for f in $files;
    do
        echo "[*] copy file: $f"
        rm $HOME/$f
        cp $(pwd)/home/$f $HOME/$f
    done

    # backup all directories
    rsync --recursive $(pwd)/home/.scripts $HOME/
    rsync --recursive $(pwd)/home/pictures $HOME/
    rsync --recursive $(pwd)/home/.config/* $HOME/.config
    xrdb ~/.Xresources
}


main () {

    check_conn
    #update_pm
    create_folder_struct
    make_backup
    #copy_dots
    #parse_progs

    # more settings
    setxkbmap us        # keyboard layout - just in case

}


# run installer
main

