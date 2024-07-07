echo "Bannister's dotfiles"


#echo "Creating an SSH key for you...\n"
#ssh-keygen -t ed25519 -C "carskb@gmail.com"
#echo "Copying public ssh key  file to your clipboard \n"
#pbcopy < ~/.ssh/bannister.pub
#echo "Please add this public key to Github \n"
#echo "https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account \n"

#read -p "Press [Enter] key after you have added the ssh key to your github account... \n"


xcode-select --install

# Install if we don't have homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"
git config --global user.name "bannister"
git config --global user.email carskb@gmail.com
#git config --global user.name "c-bannister"
#git config --global user.email christian.bannister@human.com

#sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing other brew stuff..."
apps=(
  git
  azure-cli 
  gh 
  neovim 
  iterm2 
  macdown
  fzf
  z
)
brew install ${apps[@]}

echo "Cleaning up brew"
brew cleanup

# install plugin manager for neovim
echo "Installing vim-plug plugin manager (neovim)..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# variables
dir=~/dotfiles

echo "Copying dotfiles from Github..."
#cd ~
git clone git@github.com:bannister/dotfiles.git $dir

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir

# Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh
$(brew --prefix)/opt/fzf/install

# "OMZ: Download plugins"
git clone https://github.com/supercrabtree/k ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

# Apps
cask_apps=(
  docker
  #google-chrome
  iterm2
  1password
  spotify
  #microsoft-teams
  visual-studio-code
  microsoft-office
)

# custom iterm theme (matrix)
echo "Installing custom iTerm themes..."
mkdir $HOME/iTermThemes
git clone git@gist.github.com:596193b8ede69767719c.git $HOME/iTermThemes
cd $HOME/iTermThemes
for f in *; do
  THEME=$(basename "$f")
  defaults write -app iTerm 'Custom Color Presets' -dict-add "$THEME" "$(cat "$f")"
done
cd -

# powerlevel10k
echo "Installing p10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps with Cask..."
# brew reinstall --cask --appdir="/Applications" ${cask_apps[@]i} 

brew cleanup

echo "Done!"
