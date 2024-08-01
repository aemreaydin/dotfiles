local M = { "stevearc/overseer.nvim" }

M.config = function()
	require("overseer").setup({
		strategy = "toggleterm",
		direction = "float",
	})
end

return M
