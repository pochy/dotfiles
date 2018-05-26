#!/bin/sh
cd ~/dotfiles/.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/dotfiles/.vim/bundles
rm installer.sh