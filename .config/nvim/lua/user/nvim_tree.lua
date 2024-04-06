local M = {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
	})
	require("nvim-tree").setup({
		view = { relativenumber = true },
	})
end

return M
