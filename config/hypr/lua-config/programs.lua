-- Startup Programs
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("nmcli radio wifi off")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("wal -R")
	hl.exec_cmd("fcitx5")
	hl.exec_cmd("easyeffects")
	hl.exec_cmd("wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store")
	hl.exec_cmd("hyprsunset")
end)

-- Programs
--local terminal = "kitty"
--local fileManager = "thunar"
--local browser = "zen-browser"
--local browser1 = "librewolf"
--local browser2 = "helium-browser"
--local launcher = "rofi -show drun -theme $HOME/git-related/theme.rasi"
--local notification = "swaync-client -t"
--local lock = "hyprlock"
--local spotify = "spotify-launcher"
