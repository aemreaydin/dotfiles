local M = {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}

M.config = function()
	local wk = require("which-key")
	wk.register({ a = { "<cmd>AerialToggle<CR>", "Aerial Toggle" } }, { prefix = "<leader>" })
	require("aerial").setup({
		layout = {
			min_width = 0.25,
		},
		on_attach = function(bufnr)
			vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
			vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
		end,
	})
end

return M
