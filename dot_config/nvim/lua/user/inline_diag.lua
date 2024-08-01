local M = {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
}

M.config = function() require("tiny-inline-diagnostic").setup() end

return M
