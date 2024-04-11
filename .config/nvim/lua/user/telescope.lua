local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{ "nvim-telescope/telescope-project.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
	},
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		f = {
			name = "Find",
			f = { "<cmd>Telescope find_files<CR>", "Find Files" },
			g = { "<cmd>Telescope git_files<CR>", "Git Files" },
			s = { "<cmd>Telescope grep_string<CR>", "Find String Under Cursor" },
			t = { "<cmd>Telescope live_grep<CR>", "Find Text" },
			b = { "<cmd>Telescope buffers<CR>", "Find Buffer" },
			o = { "<cmd>Telescope oldfiles<CR>", "Find Previously Opened Files" },
			h = { "<cmd>Telescope help_tags<CR>", "Find Help Tags" },
			p = { "<cmd>Telescope project<CR>", "Find Projects" },
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
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
			},
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
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
				layout_config = {
					width = 0.75,
				},
			},
			grep_string = {
				theme = "dropdown",
				layout_config = {
					width = 0.75,
				},
			},
			find_files = {
				theme = "dropdown",
				previewer = false,
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"-g",
					"!.git",
				},
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},
			planets = {
				show_pluto = true,
				show_moon = true,
			},
			colorscheme = {
				enable_preview = true,
			},
			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
			project = {
				on_project_selected = function(prompt_bufnr)
					local actions = require("telescope").extensions.project.actions
					require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)
					require("harpoon"):list():select(1)
				end,
			},
		},
	})
	telescope.load_extension("file_browser")
	telescope.load_extension("project")
end

return M
