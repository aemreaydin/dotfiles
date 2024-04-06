local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"alfaix/neotest-gtest",
		"rouge8/neotest-rust",
	},
}

M.config = function()
	require("neotest").setup({
		adapters = {
			require("neotest-rust")({ args = { "--no-capture" } }),
			require("neotest-gtest").setup({}),
		},
	})
end

return M
