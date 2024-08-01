local M = { "nvimdev/dashboard-nvim", event = "VimEnter", dependencies = { { "nvim-tree/nvim-web-devicons" } } }

M.config = function()
	require("dashboard").setup({})
end

return M
