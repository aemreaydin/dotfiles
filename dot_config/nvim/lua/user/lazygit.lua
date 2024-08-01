local M = {
	"kdheepak/lazygit.nvim",
	event = "BufReadPost",
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
		g = { "<cmd>LazyGit<CR>", "LazyGit" },
	}, { prefix = "<leader>" })
end

return M
