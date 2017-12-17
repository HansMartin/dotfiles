# Installation script...

# add some vim folders
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/undo

echo "[+] Added vim paths.."

# link plug.vim seems failing, copy that

if [ ! -z "$1" ]
then
    cp $1/vim/autoload/plug.vim ~/.vim/autoload
fi


# Installing i3blocks, currently using i3status
# apt-get install i3blocks --yes


echo "[*] ~> Change the xfce-default terminal Settings by hand!...."


