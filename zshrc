export ZSH=~/.dotfiles/zsh/oh-my-zsh

ZSH_THEME="amuse"

# Example aliases
source ~/.dotfiles/zsh/aliases

plugins=(common-aliases archlinux colored-man cp github git-flow git-prompt sublime go python pip npm systemd systemadmin docker vagrant)

source $ZSH/oh-my-zsh.sh

source ~/.dotfiles/zsh/env

# # Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
