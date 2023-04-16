#!/bin/sh

mkdir download
cd download
curl https://dl.suckless.org/dwm/dwm-6.4.tar.gz -o dwm-6.4.tar.gz
curl https://dl.suckless.org/tools/dmenu-5.2.tar.gz -o dmenu-5.2.tar.gz
git clone https://git.suckless.org/slstatus
git clone https://github.com/LukeSmithxyz/st
tar -zxvf dwm-6.4.tar.gz
tar -zxvf dmenu-5.2.tar.gz
sudo cp ../configs/dwm/config.h dwm-6.4/
sudo cp ../configs/dmenu/config.h dmenu-5.2/
sudo cp ../configs/slstatus/config.h slstatus/
sudo cp ../configs/st/config.h st/
cd dwm-6.4/
make clean && sudo make install
cd ..
cd dmenu-5.2
make clean && sudo make install
cd ..
cd slstatus
make clean && sudo make install
cd ..
cd st
make clean && sudo make install
cd .. && cd ..
echo "Copy .Xresources to home directory? [y/n]"
read agree
if [ "$agree" = "y" ]; then
    cp .Xresources ~/
fi
echo "Copy .xinitrc to home directory? [y/n]"
read agree
if [ "$agree" = "y" ]; then
    cp .xinitrc ~/
fi 

echo "finished!"
