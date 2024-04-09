local M = {
	"rcarriga/nvim-notify",
}

M.config = function()
	require("notify").setup({ top_down = false, render = "minimal" })
end

return M
