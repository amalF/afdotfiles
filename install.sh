#!/bin/bash

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)

# bashrc
mv -v ~/.bashrc ~/.bashrc.old 2> /dev/null
ln -sf $BASE/bashrc ~/.bashrc
source ~/.bashrc


export GIT_SSL_NO_VERIFY=true
mkdir -p ~/.vim/autoload
curl --insecure -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

# vimrc
mv -v ~/.vimrc ~/.vimrc.old 2> /dev/null
ln -sf $BASE/vimrc ~/.vimrc

# nvim
mkdir -p ~/.config/nvim/autoload
ln -sf $BASE/vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/
# install pynvim for jedi
pip install pynvim
pip3 install pynvim

vim +PlugInstall +qall



