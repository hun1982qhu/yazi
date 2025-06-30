-- ## {{{ Linemode:size_and_mtime()函数

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

-- ## }}} Linemode:size_and_mtime()函数

-- ## {{{ bookmarks

require("bookmarks"):setup({
	last_directory = { enable = false, persist = false },
	persist = "none",
	desc_format = "full",
	file_pick_mode = "hover",
	notify = {
		enable = false,
		timeout = 1,
		message = {
			new = "New bookmark '<key>' -> '<folder>'",
			delete = "Deleted bookmark in '<key>'",
			delete_all = "Deleted all bookmarks",
		},
	},
})

-- ## }}} bookmarks

-- ## {{{ full_border

require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

-- ## }}} full_border

-- ## {{{ bunny

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

-- ## }}} bunny

-- ## {{{ copy-file-contents

require("copy-file-contents"):setup({
	append_char = "\n",
	notification = true,
})

-- ## }}} copy-file-contents

-- ## {{{ restore

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

-- ## }}} restore

-- ## {{{ yamb 书签插件

-- You can configure your bookmarks by lua language
local bookmarks = {}

local path_sep = package.config:sub(1, 1)
local home_path = ya.target_family() == "windows" and os.getenv("USERPROFILE") or os.getenv("HOME")
if ya.target_family() == "windows" then
	table.insert(bookmarks, {
		tag = "Scoop Local",

		path = (os.getenv("SCOOP") or home_path .. "\\scoop") .. "\\",
		key = "p",
	})
	table.insert(bookmarks, {
		tag = "Scoop Global",
		path = (os.getenv("SCOOP_GLOBAL") or "C:\\ProgramData\\scoop") .. "\\",
		key = "P",
	})
end
table.insert(bookmarks, {
	tag = "Desktop",
	path = home_path .. path_sep .. "Desktop" .. path_sep,
	key = "d",
})

require("yamb"):setup({
	-- Optional, the path ending with path separator represents folder.
	bookmarks = bookmarks,
	-- Optional, receive notification every time you jump.
	jump_notify = true,
	-- Optional, the cli of fzf.
	cli = "fzf",
	-- Optional, a string used for randomly generating keys, where the preceding characters have higher priority.
	keys = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
	-- Optional, the path of bookmarks
	path = (ya.target_family() == "windows" and os.getenv("APPDATA") .. "\\yazi\\config\\bookmark")
		or (os.getenv("HOME") .. "/.config/yazi/bookmark"),
})

-- ## }}} yamb 书签插件
