-- ~/.config/yazi/init.lua

require("bookmarks"):setup({
	save_last_directory = true, -- DEPRECATED - will be removed in the future. Use `last_directory`
	last_directory = { enable = true, persist = true },
	persist = "all",
	desc_format = "full",
	file_pick_mode = "hover",
	notify = {
		enable = true,
		timeout = 3,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})

require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

local home = os.getenv("HOME")
require("bunny"):setup({
	hops = {
		{ tag = "home", path = home, key = "h" },
		{ tag = "nix-store", path = "/nix/store", key = "n" },
		{ tag = "nix-config", path = home .. "/.config/nix", key = "c" },
		{ tag = "config", path = home .. "/.config", key = "C" },
		{ tag = "local", path = home .. "/.local", key = "l" },
		{ tag = "tmp-home", path = home .. "/tmp", key = "t" },
		{ tag = "tmp", path = "/tmp", key = "T" },
		{ tag = "downloads", path = home .. "/downloads", key = "d" },
		{ tag = "music", path = home .. "/music", key = "m" },
		{ tag = "rekordbox", path = home .. "/music/dj-tools/rekordbox", key = "r" },
	},
	notify = true, -- notify after hopping, default is false
	fuzzy_cmd = "sk", -- fuzzy searching command, default is fzf
})
