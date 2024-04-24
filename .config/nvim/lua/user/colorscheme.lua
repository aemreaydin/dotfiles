-- local M = {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	version = false,
-- 	lazy = false,
-- 	priority = 1000,
-- }

local M = {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
}

function M.config()
	-- vim.o.background = "light"
	require("everforest").setup({
		background = "medium",
		italics = true,
	})
	vim.cmd.colorscheme("everforest")
	-- require("catppuccin").setup({
	-- 	background = { dark = "frappe" },
	-- 	styles = {
	-- 		comments = { "bold" },
	-- 		keywords = { "bold", "italic" },
	-- 	},
	-- 	integrations = {
	-- 		notify = true,
	-- 		harpoon = true,
	-- 		noice = true,
	-- 	},
	-- })
	-- vim.cmd.colorscheme("catppuccin")
end

return M
