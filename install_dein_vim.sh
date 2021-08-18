#!/bin/sh
cd ~/dotfiles/.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
mkdir ~/.cache/dein
sh ./installer.sh ~/.cache/dein
rm installer.sh

mkdir -p ~/.config/nvim/
ln ./nvim/dein.toml ~/.config/nvim/dein.toml
ln ./nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
