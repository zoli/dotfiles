swayidle -w timeout 300 'swaylock -e -f -i $HOME/.dotfiles/wallpaper/Desktop/mountains-1412683.jpg' \
            timeout 600 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            timeout 900 'systemctl suspend' \
            before-sleep 'swaylock -e -f -i $HOME/.dotfiles/wallpaper/Desktop/mountains-1412683.jpg' &
