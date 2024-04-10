local M = {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
		"nvim-telescope/telescope.nvim",
	},
}

M.config = function()
	local home = vim.fn.expand("$HOME")
	require("chatgpt").setup({
		api_key_cmd = "gpg --decrypt " .. home .. "/openapi.gpg",
	})
end

return M
