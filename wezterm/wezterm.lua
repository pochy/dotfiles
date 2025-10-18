local wezterm = require("wezterm")
wezterm.on("gui-startup", function(cmd)
	-- local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	-- window:gui_window():maximize()
end)

return {

	keys = {
		-- 垂直分割 (SwayのデフォルトではMod+v, ここではMod+Enterを使用)
		{
			key = "Enter",
			mods = "SUPER",
			action = wezterm.action({
				SplitVertical = { domain = "CurrentPaneDomain" },
			}),
		},
		-- 水平分割 (SwayのデフォルトではMod+h, ここではMod+Shift+Enterを使用)
		{
			key = "Enter",
			mods = "SUPER|SHIFT",
			action = wezterm.action({
				SplitHorizontal = { domain = "CurrentPaneDomain" },
			}),
		}, -- ペイン間の移動
		{
			key = "h",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Left" }),
		},
		{
			key = "l",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Right" }),
		},
		{
			key = "k",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Up" }),
		},
		{
			key = "j",
			mods = "SUPER",
			action = wezterm.action({ ActivatePaneDirection = "Down" }),
		},
		{
			key = "u",
			mods = "SUPER",
			-- 上にスクロール
			action = wezterm.action({ ScrollByPage = -0.25 }),
		},
		{
			key = "d",
			mods = "SUPER",
			-- 下にスクロール
			action = wezterm.action({ ScrollByPage = 0.25 }),
		},
	},

	-- カラースキーム
	-- color_scheme = 'nord',
	color_scheme = "GruvboxDark",

	-- 透明度
	window_background_opacity = 0.90,
	-- window_background_opacity = 1,
	macos_window_background_blur = 30,

	hide_tab_bar_if_only_one_tab = true,

	-- ウィンドウの境界線と影
	window_frame = {
		border_left_width = 1,
		border_right_width = 1,
		border_top_height = 1,
		border_bottom_height = 1,
		border_left_color = "#555555",
		border_right_color = "#555555",
		border_top_color = "#555555",
		border_bottom_color = "#555555",
	},
	window_background_image_hsb = {
		brightness = 0.8,
		saturation = 1.0,
		hue = 1.0,
	},

	-- フォントとフォントサイズ
	font_size = 16.0,
	font = wezterm.font("HackGen Console NF"),

	use_ime = true,

	-- パディング
	window_padding = { left = 5, right = 5, top = 5, bottom = 5 },

	enable_scroll_bar = true,
	enable_tab_bar = true,

	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
