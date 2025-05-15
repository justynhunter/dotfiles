local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

config.mouse_bindings = {
    {
        event = { Up = { streak = 1, button = "Left" } },
        mods = "CTRL",
        action = wezterm.action.OpenLinkAtMouseCursor,
    },
}

config.term = "xterm-256color"

config.native_macos_fullscreen_mode = true
config.color_scheme = 'catppuccin-frappe'

config.font = wezterm.font("BlexMono Nerd Font Mono", { weight = 500 })
config.font_size = 13

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
