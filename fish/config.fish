set fish_greeting ''
set -gx PATH $PATH $HOME/.dotfiles/bin

set __prompt_icons '⚞' '🎩' '🐳' '🐥' '⛵' '🚀' '🌁' '🎪' '🌠' '🎵' '🐉' '🐧'
set __prompt_icon (random 1 12)

function fish_prompt
	set last_status $status
	set_color A6E22E
	printf $__prompt_icons[$__prompt_icon]' '
	set_color $fish_color_host
	printf $USER'@%s ' (prompt_hostname)
	set_color $fish_color_cwd
	printf '%s' (prompt_pwd)
	set_color normal
	printf '%s\n→ ' (__informative_git_prompt)
	set_color normal
end
