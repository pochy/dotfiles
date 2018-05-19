#!/bin/sh
git submodule init
git submodule update
git submodule foreach 'git checkout master'
cd .vim/autoload
if test -e "pathogen.vim"; then
    rm pathogen.vim
fi
ln -s ../bundle/vim-pathogen/autoload/pathogen.vim .

cd ~/.vim/bundle/vimproc
if type make > /dev/null 2>&1; then
        make
else
        echo  "Download from https://github.com/Shougo/vimproc.vim/releases"
fi
