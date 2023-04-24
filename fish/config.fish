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
set __prompt_icon (math (date +%d) % 10)


starship init fish | source