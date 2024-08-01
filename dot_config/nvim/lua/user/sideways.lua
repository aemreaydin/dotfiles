local M = {
	"AndrewRadev/sideways.vim",
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		["sl"] = { "<cmd>SidewaysRight<CR>", "Sideways Right" },
		["sr"] = { "<cmd>SidewaysLeft<CR>", "Sideways Left" },
	}, { prefix = "<leader>" })
end

return M
