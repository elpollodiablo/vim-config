#!/bin/bash

if [ -f "`which lsb_release`" ]; then
	system=`lsb_release -s -id |head -1`
else
	system="osx";
fi;
case $system in
	Ubuntu)
		sudo apt-get remove -y vim-tiny vim-nox vim
		sudo apt-get install -y vim-nox-py2 cmake nodejs python-dev python3-dev build-essential;
		sudo npm install -g typescript
		;;
	Debian)
		sudo apt-get remove -y vim-tiny vim
		sudo apt-get install -y vim-nox cmake nodejs python-dev python3-dev build-essential;
		;;
	osx)
		brew remove vim
		brew cleanup
		brew install vim --with-python3 --with-override-system-vim
		;;
	*)
		echo "couldn't identify system"
		exit 1
esac

mkdir -p ~/.vim/bundle/

if [ -d ~/.vim/bundle/Vundle.vim ]; then
	echo "updating vundle"
	pushd ~/.vim/bundle/Vundle.vim
	git pull
	popd;
else
	echo "installing vundle"
	mkdir -p ~/.vim ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi;

rm -f ~/.vim/vimrc
SCRIPT_DIR=`dirname $0`
FULL_DIR="`( cd \"$SCRIPT_DIR\" && pwd )`"
ln -s $FULL_DIR/vimrc ~/.vim/vimrc

vim +PluginInstall +qall

if [ -f "/root/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so" ]; then
	echo "ycm already installed"
else
	pushd ~/.vim/bundle/YouCompleteMe
	./install.py --clang-completer --tern-completer
	popd;
fi;
echo "https://github.com/j1z0/dotfiles.git"

