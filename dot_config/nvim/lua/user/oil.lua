local M = {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
}

function M.config()
	require("oil").setup({
		skip_confirm_for_simple_edits = true,
		float = {
			max_height = 20,
			max_width = 60,
		},
	})
	vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
end

return M
