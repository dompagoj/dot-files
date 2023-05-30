# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="/home/domagoj/.oh-my-zsh"

#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

path+=('/home/domagoj/.dotnet')
path+=('/home/domagoj/.dotnet/tools')
path+=('/usr/local/share/flutter/bin')
path+=('/home/domagoj/.npm-global/bin')
path+=('/home/domagoj/.pub-cache/bin/')
path+=('/home/domagoj/.platformio/penv/bin')


export PATH
export GIT_EDITOR='nvim'
export FZF_DEFAULT_COMMAND='rg --files'

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
	npm
)
source $ZSH/oh-my-zsh.sh

alias chrome=/opt/google/chrome/chrome
alias mnt_network_drive=sudo mount -t cifs -o username=dom,vers=2.0 //192.168.2.1/share /mnt/network_drive
alias dpc="node /home/domagoj/dev/dompa_comp/dpc/node_out/index.js"
alias lg=lazygit
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias gdb=rust-gdb
alias v=~/v_lang/v

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

