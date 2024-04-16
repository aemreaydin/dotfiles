local M = {
	"rcarriga/nvim-notify",
}

M.config = function()
	require("notify").setup({ top_down = false })
end

return M
