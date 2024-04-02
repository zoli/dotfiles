set fish_greeting ''
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
set -gx GOPATH $HOME/.go
set -gx EDITOR nvim
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1
set -gx TMUX_PLUGIN_MANAGER_PATH ~/.config/tmux/plugins/
set -g FZF_DEFAULT_COMMAND 'fd -t f'
set -g FZF_CD_COMMAND 'fd -t d -t l'

alias vim=nvim

# if status is-login
#     if test -z "$DISPLAY" -a $XDG_VTNR = 1
#         exec startx -- -keeptty
#     end
# end

source /usr/share/icons-in-terminal/icons.fish

set __prompt_icons $mfizz_ghost $file_gitlab $linux_debian $weather_day_storm_showers $mfizz_splatter $file_electron $fa_firefox $mfizz_docker $mfizz_redhat
set __prompt_icon (math (date +%d) % 9 + 1)


mcfly init fish | starship init fish | source
