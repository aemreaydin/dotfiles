ZSH_PATH="$HOME/.config/zsh"

export PATH="/opt/homebrew/bin:/opt/homebrew/opt/llvm/bin:$PATH"

if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi

export ZSH="$HOME/.oh-my-zsh"
if [ ! -d "$ZSH" ]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
fi

ZSH_THEME="robbyrussell"
plugins=(git tmux zoxide)
source $ZSH/oh-my-zsh.sh

source "$ZSH_PATH/.alias"

