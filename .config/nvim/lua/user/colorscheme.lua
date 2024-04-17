local M = {
	"folke/tokyonight.nvim",
	dependencies = { { "catppuccin/nvim", name = "catppuccin" } },
	lazy = false,
	priority = 1000,
	opts = {},
}

function M.config()
	-- vim.cmd.colorscheme("catppuccin")
	vim.cmd.colorscheme("tokyonight-night")
end

return M
