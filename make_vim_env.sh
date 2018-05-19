#!/bin/sh
git submodule init
git submodule update
git submodule foreach 'git checkout master'
cd .vim/autoload
ln -s ../bundle/vim-pathogen/autoload/pathogen.vim .