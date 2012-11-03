#!/bin/sh
git submodule update --init --recursive &&
mv -f ~/.vim ~/.vim_bak_`date +%s`
ln -s $PWD/.vim ~/.vim &&
mv -f ~/.vimrc ~/.vimrc_bak_`date +%s`
ln -s $PWD/.vimrc ~/.vimrc &&
vim +BundleInstall +qall
