#!/bin/sh

DOT_FILES_TARGET=$(readlink -f '../../dotfiles/')

ln -s "$DOT_FILES_TARGET/.vimrc" ~/.vimrc
ln -s "$DOT_FILES_TARGET/.vim" ~/.vim

ln -s "$DOT_FILES_TARGET/.bashrc" ~/.bashrc
ln -s "$DOT_FILES_TARGET/.bash" ~/.bash

source ~/.bashrc