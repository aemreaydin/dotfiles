local M = {
	"folke/trouble.nvim",
	branch = "dev",
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		x = {
			name = "Trouble",
			x = {
				"<cmd>Trouble diagnostics toggle<cr>",
				"Diagnostics",
			},
			X = {
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				"Buffer Diagnostics",
			},
			s = {
				"<cmd>Trouble symbols toggle focus=false<cr>",
				"Symbols",
			},
			l = {
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				"LSP Definitions / references / ...",
			},
			L = {
				"<cmd>Trouble loclist toggle<cr>",
				"Location List",
			},
			Q = {
				"<cmd>Trouble qflist toggle<cr>",
				"Quickfix List",
			},
		},
	}, { prefix = "<leader>" })

	require("trouble").setup({
		modes = {
			preview_float = {
				mode = "diagnostics",
				preview = {
					type = "float",
					relative = "editor",
					border = "rounded",
					title = "Preview",
					title_pos = "center",
					position = { 0, -2 },
					size = { width = 0.3, height = 0.3 },
					zindex = 200,
				},
			},
		},
	})
end

return M
