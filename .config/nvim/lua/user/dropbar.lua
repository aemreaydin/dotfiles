local M = {
	"Bekaboo/dropbar.nvim",
	dependencies = {
		{ "nvim-telescope/telescope-fzf-native.nvim" },
	},
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		d = {
			name = "Dropbar",
			p = { "<cmd>lua require('dropbar.api').pick()<CR>", "Pick" },
		},
	}, { prefix = "<leader>" })
	require("dropbar").setup({})
end

return M
