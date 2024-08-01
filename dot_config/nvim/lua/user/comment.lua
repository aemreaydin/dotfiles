local M = {
	"numToStr/Comment.nvim",
	lazy = false,
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		["<leader>/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment Line" },
	})
	wk.register({
		["<leader>/"] = {
			"<Plug>(comment_toggle_linewise_visual)",
			"Comment Line",
			mode = "v",
		},
	})
	require("Comment").setup()
end

return M
