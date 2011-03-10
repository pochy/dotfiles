#!/bin/sh

wget http://downloads.sourceforge.net/project/zsh/zsh-dev/4.3.10/zsh-4.3.10.tar.gz
tar zvxf zsh-4.3.10.tar.gz
cd zsh-4.3.10
./configure --prefix=$HOME/local --enable-multibyte --enable-locale
make
make install

cd

wget http://ftp.gnu.org/gnu/screen/screen-4.0.3.tar.gz
tar zxvf screen-4.0.3.tar.gz
cd screen-4.0.3/
./configure --prefix=$HOME/local --enable-colors256 --enable-locale
make
make install

cd

wget ftp://ftp.jp.vim.org/pub/vim/unix/vim-7.2.tar.bz2
wget ftp://ftp.jp.vim.org/pub/vim/extra/vim-7.2-lang.tar.gz
wget ftp://ftp.jp.vim.org/pub/vim/extra/vim-7.2-extra.tar.gz
tar xjvf vim-7.2.tar.bz2
tar xzvf vim-7.2-lang.tar.gz
tar xzvf vim-7.2-extra.tar.gz
cd vim72/
mkdir patches
cd patches/
wget ftp://ftp.jp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz
wget ftp://ftp.jp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz
wget ftp://ftp.jp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz
wget ftp://ftp.jp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz
curl -O 'ftp://ftp.jp.vim.org/pub/vim/patches/7.2/7.2.[401-411]'
gzip -d 7.2.001-100.gz
gzip -d 7.2.101-200.gz
gzip -d 7.2.201-300.gz
gzip -d 7.2.301-400.gz
cd ..
cat patches/* | patch -p0
./configure --prefix=$HOME/local --with-features=big --enable-multibyte --disable-netbeans --disable-gtktest --disable-acl --disable-gpm --disable-xim --without-x --disable-gui
make
make install

cd

wget http://www.ff.iij4u.or.jp/~nrt/freeware/lv451.tar.gz
tar xzvf lv451.tar.gz
cd lv451/build/
../src/configure --prefix=$HOME/local
make
make install

cd

wget http://kernel.org/pub/software/scm/git/git-1.7.4.1.tar.bz2
tar xvfj git-1.7.4.1.tar.bz2
cd git-1.7.4.1/
./configure --with-iconv=$HOME/local --prefix=$HOME/local
make prefix=$HOME/local all
make prefix=$HOME/local install

cd

~/local/bin/git clone git://github.com/pochy/dotfiles.git
ln -s dotfiles/.zshrc .zshrc
ln -s dotfiles/.vimrc .vimrc
ln -s dotfiles/.vim .vim
ln -s dotfiles/.screenrc .screenrc

git config --global color.ui auto
git config --global core.pager 'lv -Ou8 -c'
