#!/bin/sh

###############################################################################
### Remember where we started
###############################################################################

HERE=`pwd`

###############################################################################
### Package dependencies
###############################################################################

if [ "$1" = "osx" ]; then
  sudo port selfupdate
  sudo port install curl
  sudo port install git
  sudo port install vim
else
  sudo apt-get update
  sudo apt-get install curl
  sudo apt-get install git
  sudo apt-get install vim
fi

###############################################################################
### Bash it
###############################################################################

rm -rf ~/.bash_it ~/.bashrc.bak ~/.bash_profile.bak rcfile

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

if [ "$1" = "osx" ]; then
  cat ~/.bash_profile | tail -r | tail -n +3 | tail -r > rcfile
  echo "export BASH_IT_THEME='sexy'" >> rcfile
  echo "" >> rcfile
  tail -n 2 ~/.bash_profile >> rcfile
  mv rcfile ~/.bash_profile
else
  head -n -2 ~/.bashrc > rcfile
  echo "export BASH_IT_THEME='sexy'" >> rcfile
  echo "" >> rcfile
  tail -n 2 ~/.bashrc >> rcfile
  mv rcfile ~/.bashrc
  source ~/.bashrc
fi

###############################################################################
### Pathogen
###############################################################################

rm -rf ~/.vim/autoload
rm -rf ~/.vim/bundle

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

###############################################################################
### Solarized Colorscheme
###############################################################################

cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized.git

###############################################################################
### vim-airline
###############################################################################

cd ~/.vim/bundle
git clone https://github.com/bling/vim-airline 

###############################################################################
### vim-airline themes
###############################################################################

cd ~/.vim/bundle
git clone https://github.com/vim-airline/vim-airline-themes

###############################################################################
### Powerline fonts
###############################################################################

git clone https://github.com/powerline/fonts
cd fonts
./install.sh
cd ..
rm -rf fonts

###############################################################################
### vim-fugitive
###############################################################################

cd ~/.vim/bundle
git clone https://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q

###############################################################################
### vim-signify
###############################################################################

cd ~/.vim/bundle
git clone https://github.com/mhinz/vim-signify 

###############################################################################
### .vimrc
###############################################################################

cd $HERE
cp .vimrc ~/.vimrc

###############################################################################
### git configuration
###############################################################################

git config --global user.name "eric schkufza"
git config --global user.email "eric.schkufza@gmail.com"
git config --global push.default simple
git config --global core.editor "vim"
git config --global credential.https://github.com.username eschkufz

###############################################################################
### Parting thoughts
###############################################################################

echo "Remember to change your terminal fonts"

if [ "$1" = "osx" ]; then
  echo "Remember to source ~/.bash_profile"
fi
