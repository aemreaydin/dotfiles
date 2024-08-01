local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "meuter/lualine-so-fancy.nvim" },
}

M.config = function()
	require("lualine").setup({
		options = {
			theme = require("neofusion.lualine"),
			icons_enabled = true,
			-- component_separators = { left = "|", right = "|" },
			-- section_separators = { left = "", right = "" },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = { "NvimTree" },
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			},
		},
		sections = {
			lualine_a = {},
			lualine_b = {
				"fancy_branch",
			},
			lualine_c = {
				{
					"filename",
					path = 1,
					symbols = {
						modified = "  ",
					},
				},
				"fancy_diff",
				{
					"fancy_diagnostics",
					sources = { "nvim_lsp" },
					symbols = { error = " ", warn = " ", info = " " },
				},
			},
			lualine_x = {
				{ "fancy_macro" },
				{ "fancy_filetype" },
				"encoding",
				"progress",
				"fileformat",
			},
			lualine_y = {},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
