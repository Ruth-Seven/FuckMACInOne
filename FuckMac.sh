#!/bin/sh

#set -x

# install brew
echo '\033[33:41m' Install brew............. '\033[0m'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

SYSTEM=`uname -s`
if [[ $SYSTEM == "Darwin" ]]; then
  echo '\033[32:41m' .............Congra, the machine is MAC '\033[0m'
elif [[ $SYSTEM == "Linux" ]]; then
  echo '\033[32:41m' .............opz, the machine is Linux '\033[0m'
else 
  echo '\033[32:41m' .............Maybe It dosen\'t work in $(SYSTEM)'\033[0m'
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
if [[ $SYSTEM == "Linux" ]]; then
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/hujunjie.ove/.zprofile
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# install ozh
echo '\033[33:41m' Install ozh............. '\033[0m'
uninstall_oh_my_zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "plugins=(git zsh-syntax-highlighting zsh-autosuggestions autojump)" >>.zshrc

# install some useful applications
echo '\033[33:41m' Install Applications............. '\033[0m'
brew install git tldr autojump the_silver_searcher fd fzf nvim zsh tmux

# tmux Configurature https://github.com/gpakosz/.tmux
echo '\033[33:41m' Install tmux............. '\033[0m'

git clone https://github.com/gpakosz/.tmux.git ./oh-my-tmux
echo "set-option -g default-shell /bin/zsh" >>./oh-my-tmux/.tmux.conf
ln -s -f ./oh-my-tmux/.tmux.conf ~/.tmux.conf
cp ./oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local

# Vim configurature
## bundle
echo '\033[33:41m' Install Vim............. '\033[0m'
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cat vundle_vimrc >>~/.vimrc

vim +PluginInstall +qall

## https://github.com/amix/vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

## auto-completeMe https://github.com/ycm-core/YouCompleteMe#full-installation-guide
## installed by vundle
brew install cmake python mono go nodejs
brew install java
sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

## navigator https://github.com/christoomey/vim-tmux-navigator
vim +PluginInstall +qall

echo '\033[33:41m' Done! '\033[0m'
