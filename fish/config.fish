set fish_greeting ''
set -gx PATH $PATH $HOME/.dotfiles/bin
set -gx GOPATH $HOME/.go
set -gx EDITOR vim
set -g FZF_DEFAULT_COMMAND 'fd -t f'
set -g FZF_CD_COMMAND 'fd -t d -t l'

if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end

source /usr/share/icons-in-terminal/icons.fish

set __prompt_icons $mfizz_ghost $file_gitlab $linux_debian $weather_day_storm_showers $mfizz_splatter $file_electron $fa_firefox $fa_google_wallet $mfizz_docker $mfizz_redhat
set __prompt_icon (random 1 10)

function fish_prompt
	set last_status $status

	set_color A6E22E
	printf $__prompt_icons[$__prompt_icon]'  '

	if test ! $TMUX;
		set_color $fish_color_host
		printf $USER'@%s ' (prompt_hostname)
	end;

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
