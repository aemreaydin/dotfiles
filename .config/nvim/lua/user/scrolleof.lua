local M = {
	"Aasim-A/scrollEOF.nvim",
	event = { "CursorMoved", "WinScrolled" },
}

M.config = function()
	require("scrollEOF").setup({ insert_mode = true })
end

return M
