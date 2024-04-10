local M = {
	"folke/tokyonight.nvim",
	dependencies = { { "catppuccin/nvim", name = "catppuccin" }, { "rebelot/kanagawa.nvim" } },
	lazy = false,
	priority = 1000,
	opts = {},
}

function M.config()
	vim.cmd.colorscheme("kanagawa-wave")
end

return M
