#!/bin/bash

DON_FILES=(.zshrc)

for file in ${DONT_FILES[@]}
do
  ln -s $HOME/work/dotfiles/$file $HOME/$file
done
