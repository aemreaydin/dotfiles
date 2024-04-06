local M = {
	"SmiteshP/nvim-navbuddy",
	dependencies = {
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>o"] = { "<cmd>Navbuddy<cr>", "Nav" },
	})

	local navbuddy = require("nvim-navbuddy")
	navbuddy.setup({
		window = {
			border = "rounded",
		},
		lsp = { auto_attach = true },
	})
end

return M
