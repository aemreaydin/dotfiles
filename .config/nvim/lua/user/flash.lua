local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
}

M.config = function()
	require("flash").setup({})
end

return M
