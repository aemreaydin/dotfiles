local M = {
	"zbirenbaum/copilot-cmp",
	dependencies = { "zbirenbaum/copilot.lua" },
}

M.config = function()
	require("copilot").setup({
		suggestion = { enabled = false },
	})
	require("copilot-cmp").setup({})
end

return M
