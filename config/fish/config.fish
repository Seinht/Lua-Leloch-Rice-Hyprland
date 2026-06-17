source ./cachyos-config.fish

# Set pywal16
source ~/.config/wal/templates/colors.fish
cat ~/.cache/wal/sequences &

# Set sudoedit for nvim
set -gx SUDO_EDITOR nvim

#Alias
alias hyprbar='waybar | killall waybar && nohup waybar &'
alias resnet='sudo systemctl restart NetworkManager'
alias respip='systemctl --user restart pipewire pipewire-pulse'
alias dim='nohup hyprsunset -g 35 &'
alias ddim='nohup hyprsunset -g 20 &'
alias dddim='nohup hyprsunset -g 15 &'
alias undim='killall hyprsunset'

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end
