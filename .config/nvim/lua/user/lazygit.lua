local M = {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		["gg"] = { "<cmd>LazyGit<CR>", "LazyGit" },
	}, { prefix = "<leader>" })
	require("telescope").load_extension("lazygit")
end

return M
