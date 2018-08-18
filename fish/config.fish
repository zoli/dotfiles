set fish_greeting ''
set -gx PATH $PATH $HOME/.dotfiles/bin
set -gx GOPATH $HOME/Code/go
set -gx EDITOR vim

source ~/.local/share/icons-in-terminal/icons.fish

set __prompt_icons '⚞' '🎩' '🐳' '🐥' '⛵' '🚀' '🌁' '🎪' '🌠' '🎵' '🐉' '🐧'
set __prompt_icon (random 1 12)

function fish_prompt
	set last_status $status

	set_color A6E22E
	printf $__prompt_icons[$__prompt_icon]' '

	set_color $fish_color_host
	printf $USER'@%s ' (prompt_hostname)

	set_color $fish_color_cwd
	set -l spwd (string split -r -m2 / $PWD)
	set -l usr (string split / $HOME)
	if [ "$HOME" = "$PWD" ]
		echo -n "~"
	else if [ "$spwd[2]" = "$usr[-1]" ]
		echo -n "~/$spwd[3]"
	else
		echo -n "$spwd[2]/$spwd[3]"
	end

	set_color normal
	printf '%s\n→ ' (__informative_git_prompt)

	set_color normal
end
