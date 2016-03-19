#!/bin/bash

DOT_FILES_TARGET=$(readlink -f '../../dotfiles/')

rm ~/.vim
rm ~/.vimrc
rm ~/.bash
rm ~/.bashrc
rm ~/.gitconfig

ln -sf "$DOT_FILES_TARGET/.vimrc" ~/.vimrc
echo '.vimrc created.'

ln -sf "$DOT_FILES_TARGET/.vim" ~/.vim
echo '.vim created.'

ln -sf "$DOT_FILES_TARGET/.bashrc" ~/.bashrc
echo '.bashrc created.'
ln -sf "$DOT_FILES_TARGET/.bash" ~/.bash
echo '.bash created.'

source ~/.bashrc
echo 'sourcing ~/.bashrc completed'

read -p "Please enter email address: " email
read -p "Please enter full name: " fullName

gitFile=$(cat "$DOT_FILES_TARGET/.gitconfig")

match='<email>'
gitfileChanges=${gitFile//$match/$email}

match='<fullname>'
gitfileChanges=${gitfileChanges//$match/$fullName}

match='<username>'
gitfileChanges=${gitfileChanges//$match/$USER}

echo "$gitfileChanges" > ~/.gitconfig


