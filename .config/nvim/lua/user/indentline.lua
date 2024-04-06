local M = { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }

M.config = function()
	require("ibl").setup({
		exclude = {
			filetypes = {
				"help",
				"terminal",
				"startify",
				"dashboard",
				"lazy",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"text",
			},
		},
	})
end

return M
