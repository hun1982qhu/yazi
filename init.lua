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
-- ~/.config/yazi/init.lua
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return string.format("%s %s", size and ya.readable_size(size) or "-", time)
end
require("copy-file-contents"):setup({
	append_char = "\n",
	notification = true,
})
require("git"):setup()
-- if os.getenv("NVIM") then
-- 	require("hide-preview"):entry()
-- end
require("restore"):setup({
	-- Set the position for confirm and overwrite dialogs.
	-- don't forget to set height: `h = xx`
	-- https://yazi-rs.github.io/docs/plugins/utils/#ya.input
	position = { "center", w = 70, h = 40 },

	-- Show confirm dialog before restore.
	-- NOTE: even if set this to false, overwrite dialog still pop up
	show_confirm = true,

	-- colors for confirm and overwrite dialogs
	theme = {
		title = "blue",
		header = "green",
		-- header color for overwrite dialog
		header_warning = "yellow",
		list_item = { odd = "blue", even = "blue" },
	},
})
require("dual-pane"):setup()
