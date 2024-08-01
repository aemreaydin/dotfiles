local M = { "nvim-focus/focus.nvim", version = "*" }

M.config = function()
	require("focus").setup({})
end

return M
