local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "ahmedkhalf/project.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		f = {
			name = "Find",
			a = { "<cmd>Telescope aerial<CR>", "Find symbols" },
			b = { "<cmd>Telescope buffers<CR>", "Find Buffer" },
			c = { "<cmd>Telescope colorscheme<CR>", "Preview Colorschemes" },
			d = { "<cmd>TodoTelescope<CR>", "Todo Telescope" },
			f = { "<cmd>Telescope find_files<CR>", "Find Files" },
			g = { "<cmd>Telescope git_files<CR>", "Git Files" },
			h = { "<cmd>Telescope help_tags<CR>", "Find Help Tags" },
			n = { "<cmd>Telescope notify<CR>", "Notify Messages" },
			o = { "<cmd>Telescope oldfiles<CR>", "Find Previously Opened Files" },
			p = { "<cmd>Telescope projects<CR>", "Find Projects" },
			s = { "<cmd>Telescope grep_string<CR>", "Find String Under Cursor" },
			t = { "<cmd>Telescope live_grep<CR>", "Find Text" },
			B = { "<cmd>Telescope file_browser<CR>", "File Browser" },
			C = { "<cmd>Telescope commands<CR>", "Find Commands" },
			H = { "<cmd>Telescope command_history<CR>", "Find From Command History" },
			S = { "<cmd>Telescope search_history<CR>", "Find From Search History" },
		},
	}, { prefix = "<leader>" })

	local telescope = require("telescope")
	local actions = require("telescope.actions")
	telescope.setup({
		defaults = {
			winblend = 0,
			layout_config = {
				horizontal = {
					preview_width = 0.6,
					results_width = 0.8,
				},
				vertical = {
					width = 0.95,
				},
				width = 0.95,
				height = 0.8,
				preview_cutoff = 120,
			},
			file_ignore_patterns = { "node_modules", "vcpkg" },
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},
			mappings = {
				i = {
					["<esc>"] = actions.close,
					["<C-e>"] = require("telescope.actions.layout").toggle_preview,
				},
			},
		},
		pickers = {
			find_files = {
				previewer = false,
				layout_config = {
					height = 0.4,
					prompt_position = "top",
					preview_cutoff = 120,
				},
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"-g",
					"!.git",
					"-g",
					"!vcpkg*",
				},
			},
			git_files = {
				previewer = false,
				layout_config = {
					height = 0.4,
					prompt_position = "top",
					preview_cutoff = 120,
				},
			},
			buffers = {
				mappings = {
					i = {
						["<c-d>"] = actions.delete_buffer,
					},
					n = {
						["<c-d>"] = actions.delete_buffer,
					},
				},
				previewer = false,
				initial_mode = "normal",
				-- theme = "dropdown",
				layout_config = {
					height = 0.4,
					width = 0.6,
					prompt_position = "top",
					preview_cutoff = 120,
				},
			},
			current_buffer_fuzzy_find = {
				previewer = true,
				layout_config = {
					prompt_position = "top",
					preview_cutoff = 120,
				},
			},
			live_grep = {
				only_sort_text = true,
				previewer = true,
			},
			grep_string = {
				only_sort_text = true,
				previewer = true,
			},
			lsp_references = {
				show_line = false,
				previewer = true,
			},
			treesitter = {
				show_line = false,
				previewer = true,
			},
			colorscheme = {
				enable_preview = true,
			},
		},
		-- pickers = {
		-- 	live_grep = {
		-- 		theme = "dropdown",
		-- 		layout_config = {
		-- 			width = 0.75,
		-- 		},
		-- 	},
		-- 	grep_string = {
		-- 		theme = "dropdown",
		-- 		layout_config = {
		-- 			width = 0.75,
		-- 		},
		-- 	},
		-- 	find_files = {
		-- 		theme = "dropdown",
		-- 		previewer = false,
		-- 		find_command = {
		-- 			"rg",
		-- 			"--files",
		-- 			"--hidden",
		-- 			"-g",
		-- 			"!.git",
		-- 			"-g",
		-- 			"!vcpkg*",
		-- 		},
		-- 	},
		-- 	buffers = {
		-- 		theme = "dropdown",
		-- 		previewer = false,
		-- 		mappings = {
		-- 			i = {
		-- 				["<C-d>"] = actions.delete_buffer,
		-- 			},
		-- 			n = {
		-- 				["dd"] = actions.delete_buffer,
		-- 			},
		-- 		},
		-- 	},
		-- 	planets = {
		-- 		show_pluto = true,
		-- 		show_moon = true,
		-- 	},
		-- 	colorscheme = {
		-- 		enable_preview = true,
		-- 	},
		-- 	lsp_references = {
		-- 		theme = "dropdown",
		-- 		initial_mode = "normal",
		-- 	},
		-- 	lsp_definitions = {
		-- 		theme = "dropdown",
		-- 		initial_mode = "normal",
		-- 	},
		-- 	lsp_declarations = {
		-- 		theme = "dropdown",
		-- 		initial_mode = "normal",
		-- 	},
		-- 	lsp_implementations = {
		-- 		theme = "dropdown",
		-- 		initial_mode = "normal",
		-- 	},
		-- },
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	})
	require("project_nvim").setup({})
	telescope.load_extension("file_browser")
	telescope.load_extension("projects")
	telescope.load_extension("aerial")
	telescope.load_extension("lazygit")
end

return M
