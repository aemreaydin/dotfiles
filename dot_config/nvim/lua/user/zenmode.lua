local M = {
	"folke/zen-mode.nvim",
}

M.config = function()
	require("zen-mode").setup({
		twilight = { enabled = false },
		plugins = {},
	})
end

return M
