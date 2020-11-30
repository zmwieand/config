#!/bin/bash

echo "Installing brew configuration..."
ln -s -f `pwd`/brew/Brewfile ~/Brewfile
ln -s -f `pwd`/brew/Brewfile.lock.json ~/Brewfile.lock.json

echo "Installing zsh configuration..."
ln -s -f `pwd`/zsh/zshrc ~/.zshrc

echo "Installing vim configuration..."
DIR=$(pwd)
cd ~/
if [[ ! -d ~/.vim ]]; then
  ln -s -f ${DIR}/vim .vim
fi 
ln -s -f ${DIR}/vimrc .vimrc
cd ${DIR}

echo "Installing tmux configuration..."
ln -s -f `pwd`/tmux.conf ~/.tmux.conf

echo "Installing git configuration..."
ln -s -f `pwd`/gitignore_global ~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
git config --global alias.lg "log -n 20 --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset %an (via %cn)' --abbrev-commit --date=relative"

# Add my scripts to the PATH
echo "Installing custom scripts..."
SCRIPTS=$(ls -1 ./scripts)
for script in ${SCRIPTS}
do
  ln -s -f `pwd`/scripts/${script} /usr/local/bin/${script}
done