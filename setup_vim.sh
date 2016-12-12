#!/bin/bash

if [ -f `which lsb_release` ]; then
	system=`lsb_release -s -id |head -1`
else
	system="osx";
fi;
	case $system in
    		Ubuntu)
			sudo apt-get remove vim-tiny vim-nox vim
			sudo apt-get install vim-nox-py2 cmake nodejs python-dev python3-dev build-essential;
			sudo npm install -g typescript
			;;
		Debian)
			sudo apt-get remove vim-tiny vim
			sudo apt-get install vim-nox cmake nodejs python-dev python3-dev build-essential;
			;;
		osx)
			brew install cmake nodejs
			brew install macvim --with-override-system-vim
			;;
		*)
			echo "couldn't identify system"
			exit 1
esac

mkdir -p ~/.vim/bundle/
if [ -f ~/.vim/bundle/Vundle.vim ]; then
	pushd ~/.vim/bundle/Vundle.vim
	git pull
	popd;
else
	mkdir -p ~/.vim ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim;
fi;

rm -f ~/.vim/vimrc
ln -s `pwd`/vimrc ~/.vim/vimrc
vim +PluginInstall +qall
pushd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
popd

echo "https://github.com/j1z0/dotfiles.git"

