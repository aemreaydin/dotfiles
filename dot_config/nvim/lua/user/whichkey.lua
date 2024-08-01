local M = {
	"folke/which-key.nvim",
}

function M.config()
	local buffer_utils = require("user.utils.buffer")
	local mappings = {
		w = { "<cmd>confirm w<CR>", "Save" },
		q = { function() buffer_utils.delete_buffer_and_window_if_last() end, "Close Buffer" },
		qa = { "<cmd>confirm q<CR>", "Quit" },
		v = { function() buffer_utils.prev_on_original_buffer_on_split() end, "Vertical Split" },
	}

	local which_key = require("which-key")
	which_key.setup({
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = false,
				windows = false,
				nav = false,
				z = false,
				g = false,
			},
		},
		window = {
			border = "rounded",
			position = "bottom",
			padding = { 2, 2, 2, 2 },
		},
		ignore_missing = true,
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	})

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
	}

	which_key.register(mappings, opts)
end

return M
