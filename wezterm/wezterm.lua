local wezterm = require("wezterm")
wezterm.on("gui-startup", function(cmd)
	-- local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	-- window:gui_window():maximize()
end)

return {
	initial_rows = 36,
	initial_cols = 120,

	-- GPU負荷を抑える
	front_end = "Software",
	webgpu_power_preference = "LowPower",
	max_fps = 10,
	animation_fps = 1,
	default_cursor_style = "SteadyBlock",
	cursor_blink_rate = 0,
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	text_blink_rate = 0,
	text_blink_rate_rapid = 0,
	status_update_interval = 10000,

	keys = {
		{
			key = "Enter",
			mods = "SHIFT",
			action = wezterm.action({ SendString = "\x1b\r" }),
		},
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
	colors = {
		foreground = "#cdd6f4",
		background = "#1e1e2e",
		cursor_bg = "#f5e0dc",
		cursor_fg = "#1e1e2e",
		cursor_border = "#f5e0dc",
		selection_fg = "#1e1e2e",
		selection_bg = "#f5e0dc",
		scrollbar_thumb = "#585b70",
		split = "#585b70",
		ansi = {
			"#45475a",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#89b4fa",
			"#f5c2e7",
			"#94e2d5",
			"#bac2de",
		},
		brights = {
			"#585b70",
			"#f38ba8",
			"#a6e3a1",
			"#f9e2af",
			"#89b4fa",
			"#f5c2e7",
			"#94e2d5",
			"#a6adc8",
		},
		indexed = {
			[16] = "#fab387",
			[17] = "#f5e0dc",
		},
	},

	-- 透明度
	-- window_background_opacity = 0.90,
	window_background_opacity = 1.0,
	macos_window_background_blur = 0,

	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,
	show_tabs_in_tab_bar = false,
	show_new_tab_button_in_tab_bar = false,

	-- ウィンドウの境界線と影
	window_decorations = "RESIZE | MACOS_FORCE_DISABLE_SHADOW",
	window_frame = {
		border_left_width = 0,
		border_right_width = 0,
		border_top_height = 0,
		border_bottom_height = 0,
		border_left_color = "#555555",
		border_right_color = "#555555",
		border_top_color = "#555555",
		border_bottom_color = "#555555",
	},

	-- フォントとフォントサイズ
	font_dirs = { wezterm.home_dir .. "/Library/Fonts" },
	font_size = 14.0,
	font = wezterm.font_with_fallback({
		"HackGen Console NF",
		"Cica",
		"JetBrains Mono",
		"Hiragino Sans",
		"Symbols Nerd Font Mono",
	}),

	use_ime = true,

	-- パディング
	window_padding = { left = 2, right = 2, top = 2, bottom = 2 },

	enable_scroll_bar = false,
	enable_tab_bar = false,

	-- tmuxとの互換性を向上させる
	enable_kitty_graphics = false,

	-- ハイパーリンクのルールを定義（デフォルトルールを使用）
	hyperlink_rules = wezterm.default_hyperlink_rules(),

	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
