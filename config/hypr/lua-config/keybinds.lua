-- Programs
local terminal = "ghostty"
local fileManager = "thunar"
local browser = "~/Software/Zen-Browser/zen/zen-bin"
local browser1 = "librewolf"
local browser2 = "helium-browser"
local launcher = "rofi -show drun -theme $HOME/.config/rofi/theme.rasi"
local notification = "swaync-client -t"
local lock = "hyprlock"
local spotify = "spotify-launcher"

-- Keybinds
local mainMod = "SUPER"

-- General
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind("CTRL + SHIFT + L", hl.dsp.exec_cmd(lock))

-- Browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("DRI_PRIME=1 " .. browser))
hl.bind("ALT + B", hl.dsp.exec_cmd(browser1))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd("DRI_PRIME=1 " .. browser1))
hl.bind("CTRL + B", hl.dsp.exec_cmd(browser2))
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("DRI_PRIME=1 " .. browser2))

-- Apps
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("DRI_PRIME=1 " .. spotify))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(notification))

-- Window Sizing
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 2, action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ internal = 1, client = 1, action = "toggle" }))

-- High Level Dispatcher
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.kill())

-- Tools
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshots/"))
hl.bind(mainMod .. " + CTRL + P", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots/"))
hl.bind(mainMod .. " + ALT + P", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots/"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("wlogout"))
hl.bind(
	"CTRL + ALT + H",
	hl.dsp.exec_cmd("cliphist list | rofi -dmenu -theme /home/rui/.config/rofi/theme.rasi | cliphist decode | wl-copy")
)
hl.bind(
	"CTRL + ALT + D",
	hl.dsp.exec_cmd("cliphist list | rofi -dmenu -theme /home/rui/.config/rofi/theme.rasi | cliphist delete")
)

-- Move focus on desired window
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

-- Cycle Tab Window
hl.bind(mainMod .. " + Tab", hl.dsp.window.cycle_next())

-- Move windows
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "d" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "r" }))

-- Resize windows
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }))
hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Loop for workspaces
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
