local M = { "folke/persistence.nvim", event = "BufReadPre" }

M.config = function()
	require("persistence").setup({})
end

return M
