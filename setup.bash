has_command() {
  which "$1" 2>&1 > /dev/null
}

require_command() {
  local cmd=$1
  if ! has_command "$cmd"; then
    echo "The command $cmd is missing; install $cmd and try again."
    exit 1
  fi
}

download() {
  local url=$1
  local output=$2
  curl -L "$url" > "$output"
}

require_command 'git' &&
require_command 'curl' &&
require_command 'vim' &&
download https://github.com/bdusell/dotfiles/raw/master/.bashrc >> ~/.bashrc &&
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
download https://github.com/bdusell/dotfiles/raw/master/.vimrc > ~/.vimrc &&
vim +PluginInstall +qall
