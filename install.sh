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

# Installing packages

# apt-get install i3blocks --yes

apt-get install feh --yes
apt-get install rofi --yes
apt-get install fish --yes
apt-get install rxvt-unicode-256color --yes
apt-get install arc-theme --yes
apt-get install neofetch --yes
apt-get install python3-pip --yes
apt-get install python2-pip --yes
apt-get install w3m-img --yes
apt-get install ranger --yes
apt-get install newsboat --yes



# german keyboard Layout
setxkbmap de




