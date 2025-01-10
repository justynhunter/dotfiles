local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 's3r0 modified (terminal.sexy)'

config.font = wezterm.font("JetBrains Mono", { weight = 600 })
config.font_size = 12

config.enable_tab_bar = false
config.window_decorations = "NONE"

return config
