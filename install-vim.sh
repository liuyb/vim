#!/bin/bash

version=0.0.1

echo "Backup old ~/.vim & ~/.vimrc"
mv ~/.vim ~/.vim.bak.liuyb
mv ~/.vimrc ~/.vimrc.bak.liuyb

echo "git clone vim from https://github.com/liuyb/vim"
git clone https://github.com/liuyb/vim ~/.vim

echo "link ~/.vim/vimrc to ~/.vim"
ln -s ~/.vim/vimrc ~/.vimrc

echo "finish! please run vim"



