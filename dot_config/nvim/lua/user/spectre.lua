local M = { "nvim-pack/nvim-spectre", dependencies = { "nvim-lua/plenary.nvim" } }

M.config = function()
	require("spectre").setup({})
end

return M
