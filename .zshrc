# Path to your oh-my-zsh installation.
export ZSH="/home/dompa/.oh-my-zsh"

export PATH="$HOME/.cargo/bin:$PATH" 

ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  npm
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias apps="cd /home/dompa/Documents/Apps"
alias open="xdg-open"
alias bl="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | egrep 'percentage|state'"
alias yt2mp3="youtube-dl --extract-audio --audio-format mp3"
alias zshconfig="vim ~/.zshrc"
alias nvimconfig="vim ~/.config/nvim/init.vim"
alias servers="cd ~/Documents/Servers"
alias rg="rg -i"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/dompa/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#ONLY DISPLAY USERNAME IF SSH OR NOT DEFAULT 
DEFAULT_USER=dompa
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER@%m"
  fi
}
