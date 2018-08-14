#! /bin/bash

cp -f dot_zshrc ~/.zshrc
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh 

cp -f dot_tmux.conf ~/.tmux.conf

cp -f dot_vimrc ~/.vimrc

mkdir -p ~/.vim/templates
cp templates/* ~/.vim/templates/

mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim -c PluginInstall

pushd ~/.vim/bundle/tern_for_vim && npm install && popd
#pushd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --java-completer --js-completer --go-completer && popd
