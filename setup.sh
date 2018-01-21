if [ ! -d ~/dotfiles ]; then
  git clone https://github.com/t-sauer/dotfiles.git ~/dotfiles
fi

# Install Homebrew

if [ "$(which brew)" = "" ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Packages
brew update
brew install autojump coreutils ffmpeg git node nvm python python3 rsync ruby watchman wget yarn zsh zsh-autosuggestions zsh-syntax-highlighting
brew cask install bitbar docker dotnet gimp licecap studiolinkstandalone texmaker google-chrome iterm2 spotify skitch spectacle


# ZSH
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir -p ~/.oh-my-zsh/custom/themes
ln -sv ~/dotfiles/zsh/tsauer.zsh-theme ~/.oh-my-zsh/custom/themes/tsauer.zsh-theme

if [ -f ~/.zshrc ]; then
  rm ~/.zshrc-old
  mv ~/.zshrc ~/.zshrc-old
fi

ln -sv ~/dotfiles/zsh/.zshrc ~

curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

# pip
pip2 install cdiff

# git
ln -sv ~/dotfiles/git/.gitconfig ~
ln -sv ~/dotfiles/git/.gitconfig_private ~
ln -sv ~/dotfiles/git/.gitignore_global ~

## Manual actions:
# Adjust DEFAULT_USER in .zshrc
# - Start spectacle for the first time
# - Start bitbar and select plugin directory
# - import iterm config
# - VSCode settings sync