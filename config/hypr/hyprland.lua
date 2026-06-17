-- Sources
local home = os.getenv("HOME")
package.path = package.path
	.. ";"
	.. home
	.. "/.config/hypr/?.lua"
	.. ";"
	.. home
	.. "/.config/hypr/lua-config/?.lua"
	.. ";"
	.. home
	.. "/.cache/wal/?.lua"

require("monitors")
require("lua-config.workspaces")
require("lua-config.programs")
require("lua-config.keybinds")
require("lua-config.animations")
local wal_path = require("colors")
--local ok, colours = pcall(dofile, wal_path)
--if not ok then
--	colours = {}
--end

-- Environment-variables
hl.env("XCURSOR_THEME", "Future-dark-cursors")
hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_THEME", "Future-dark-cursors")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("GTK_THEME", "adw-gtk3-dark")
hl.env("GTK_USE_PORTAL", "0")

hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 20,

		border_size = 1,

		col = {
			active_border = { colors = { wal_path.color7, wal_path.color14, angle = 190 } },
			--active_border = { colors = { colours.color7 or "rgb(c2c0c0)", colours.color14 or "rgb(F4F4F4)" } },
			inactive_border = "rgba(595959aa)",
		},

		resize_on_border = false,

		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 5,

		active_opacity = 1,
		inactive_opacity = 1,

		shadow = {
			enabled = false,
			range = 5,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},

		blur = {
			enabled = false,
			size = 5,
			passes = 3,
			new_optimizations = true,
		},
	},
})

-- Layout
hl.config({
	dwindle = {
		preserve_split = true,
	},
})

-- Generic Wallpaper
hl.config({
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
})

-- Input KB and Mouse
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

-- Windows Rules
local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Blur layers
hl.layer_rule({
	name = "waybar",
	match = { namespace = "waybar" },
	blur = true,
})

hl.layer_rule({
	name = "rofi",
	match = { namespace = "rofi" },
	blur = true,
})
