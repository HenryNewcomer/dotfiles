#!/bin/sh

#############################################################################
#                        Author: Henry Newcomer
#############################################################################
# Description: After a new OS install, run this script to set up my custom
# software and settings
#############################################################################

# NOTE: This is a work-in-progress and is NOT complete!

#############################################################################
# Setup initial values
#############################################################################

# Used for loops awaiting user input
awaiting=true
# What distro is being used? Assume Ubuntu/Debian by default
distro="deb"

#############################################################################
# Check if arg was supplied
#############################################################################

if [ $# -eq 1 ]; then
  if [ $1 == "solus" ]; then
    distro="solus"
    echo "Distro set as $distro"
  fi
else
  echo "No arguments were passed. Defaulted distro to: $distro. Is this okay? (y/n)"

  # TODO: Get user input
  # TODO: Also, don't set a default distro
  echo "EXITING due to incomplete script"
  exit 1
fi

#############################################################################
# Functions
#############################################################################

echo "Starting..."

function updater() {
  if [ $distro == "solus" ]; then
    sudo eopkg update-repo
  else
    sudo apt update
  fi
}

function upgrader() {
  if [ $distro == "solus" ]; then
    sudo eopkg upgrade
  else
    sudo apt upgrade
  fi
}

function cleaner() {
  if [ $distro == "solus" ]; then
    # Currently not possible due to eopkg; wait for new version
    # ... :(
    echo "Attempted to clean-up leftovers, but eopkg doesn't support clean, autoclean, nor autoremove"
  else
    sudo apt clean
    sudo apt autoclean
    sudo apt autoremove
  fi
}

function installer() {
  if [ $distro == "solus" ]; then
    if [ $# -eq 1 ]; then
      sudo eopkg install $1
    elif [ $# -eq 2 ]; then
      sudo eopkg install $1 $2
    fi
  else
    # TODO: Just change this into a for loop for n arguments
    if [ $# -eq 1 ]; then
      yes | sudo apt install $1
    elif [ $# -eq 2 ]; then
      yes | sudo apt install $1 $2
    elif [ $# -eq 3 ]; then
      yes | sudo apt install $1 $2 $3
    fi
  fi
}

# TODO: Fix the repo function; remember that Solus uses a name reference when
# adding repos
function addRepo() {
  if [ $distro == "solus" ]; then
    sudo eopkg add-repo -y $1 $1
    sudo eopkg enable-repo $1
  else
    # TODO: Just change this into a for loop for n arguments
    if [ $# -eq 1 ]; then
      sudo add-apt-repository -y $1
    elif [ $# -eq 2 ]; then
      sudo add-apt-repository -y $1 $2
    fi
  fi
}

# (all unsorted)

#while [ $awaiting ]
#do
#  echo "testing: press y to quit, n to loop"
  #$input<from console
#done

#exit 0 # FOR DEBUGGING

#############################################################################
# Add repositories
#############################################################################

#sudo add-apt-repository ppa:danielrichter2007/grub-customizer

#############################################################################
# Installation processes
#############################################################################

# Update repo info
updater
# Just in case...
upgrader

###############################################
# Start installers...                         #
###############################################

# Try to stay inside of the ~/Downloads dir as often as possible
# in case of leftover files
cd ~/Downloads

# *Important; download first*
installer curl
installer cget
installer git

# NodeJS
installer nodejs
# Update npm (which is separate from nodejs)
sudo npm install npm@latest -g
#curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -
#sudo apt-get install -y nodejs
# NPM
installer npm # Required for vtop

##################
### TERMINALS (start)
##################
installer vim-gtk3 # VIM :D
installer neovim
installer tmux
installer zsh
# Changes the default terminal
chsh -s /usr/bin/zsh
# Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
##################
### TERMINALS (end)
##################

# Vim Plugin
# For Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# For Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python & Powerline
installer python
installer python3
installer python-pip
installer python-dev
installer python3-dev
sudo pip install --upgrade pip
#sudo pip install powerline-status

# Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# Tmux theme
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack

# Powerline fonts (required for tmux theme)
installer fonts-powerline # this alone should do the trick, but just in case...
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.local/share/fonts/
fc-cache -vf ~/.local/share/fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/

# YouCompleteMe (Vim plugin)
installer clang #not needed?
installer build-essential cmake
cd ~/.vim/bundle/YouCompleteMe
# JS requires NodeJS and npm
./install.py --clang-completer --js-completer
cd ~/Downloads

# Main software
installer gimp
installer gparted
installer fileftp
#installer tilix
installer thunderbird

# Extra software
npm install -g vtop
installer htop
# A simplistic color picker
installer gcolor3
installer screenfetch

# FZF
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Zsh Autosuggestions (based on history)
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# Zsh Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# i3wm
installer i3
installer feh
#installer arandr

# Extras... Any Linux user obviously needs these
sudo npm install cowsay
installer sl

###############################################
# Done with installers                        #
###############################################

# Cleanup...
cleaner

#############################################################################
# Extra notes
#############################################################################

# For manually compiling tmux:
# sudo apt install libevent-dev
# sudo apt install libncurses-dev
# To check version: tmux -V

#############################################################################
# EoF
#############################################################################

