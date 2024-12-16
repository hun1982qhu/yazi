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
