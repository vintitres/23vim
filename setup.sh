#!/bin/sh
git submodule update --init --recursive &&
if [ -e ~/.vim ]; then
    mv ~/.vim ~/.vim_bak
fi &&
ln -s $PWD/.vim ~/.vim &&
if [ -e ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc_bak
fi &&
ln -s $PWD/.vimrc ~/.vimrc &&
vim +BundleInstall +qall
