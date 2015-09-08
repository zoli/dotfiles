export ZSH=~/.dotfiles/zsh/oh-my-zsh

ZSH_THEME="zoli"

# Example aliases
source ~/.dotfiles/zsh/aliases

plugins=(common-aliases archlinux colored-man cp github git-flow git-prompt sublime go python pip npm systemd systemadmin docker vagrant)

source $ZSH/oh-my-zsh.sh

source ~/.dotfiles/zsh/env

export EDITOR='vim'

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
	export TERM='xterm-256color'
else
	export TERM='xterm-color'
fi

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK
