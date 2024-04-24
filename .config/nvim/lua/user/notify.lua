local M = {
	"rcarriga/nvim-notify",
}

M.config = function()
	require("notify").setup({
		keep = false,
		stages = "fade",
		timeout = 5,
		render = "compact",
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	})
end

return M
