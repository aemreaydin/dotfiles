local M = {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"alfaix/neotest-gtest",
		"rouge8/neotest-rust",
	},
}

M.config = function()
	require("neotest").setup({
		adapters = {
			require("neotest-rust")({ args = { "--no-capture" } }),
			require("neotest-gtest").setup({
				is_test_file = function(file)
					local filename = string.match(file, "[^/\\]+$")
					local stem, extension = filename:match("^(.+)%.(.-)$")

					if not stem or not extension then
						return false
					end

					local is_test = false

					if stem:match("^test_") or stem:match("_test$") or stem:match("%.test") then
						is_test = true
					end

					local valid_extensions = {
						["cpp"] = true,
						["cppm"] = true,
						["cc"] = true,
						["cxx"] = true,
					}

					return is_test and valid_extensions[extension]
				end,
			}),
		},
	})
end

return M
