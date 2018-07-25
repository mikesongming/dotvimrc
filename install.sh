#! /bin/bash

cp -f dot_vimrc ~/.vimrc
cp -f dot_zshrc ~/.zshrc

mkdir -p ~/.vim/templates
cp templates/* ~/.vim/templates/

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall
pushd ~/.vim/bundle/tern_for_vim && npm install && popd
#pushd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --java-completer --js-completer --go-completer && popd
