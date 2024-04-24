local M = {
	"Civitasv/cmake-tools.nvim",
}

M.config = function()
	local wk = require("which-key")
	wk.register({
		c = {
			name = "CMake",
			r = { "<cmd>CMakeRun<CR>", "CMake Run" },
			b = { "<cmd>CMakeQuickBuild all<CR>", "CMake Build" },
			s = { "<cmd>CMakeSelectLaunchTarget<CR>", "CMake Select Launch Target" },
		},
	}, { prefix = "<leader>" })
	require("cmake-tools").setup({
		cmake_build_directory = "build/${variant:buildType}",
		cmake_executor = { name = "toggleterm" },
		cmake_runner = { name = "toggleterm" },
		cmake_variants_message = {
			long = { show = false, max_length = 40 },
		},
		cmake_dap_configuration = {
			name = "cpp",
			type = "lldb-vscode",
			request = "launch",
			stopOnEntry = false,
			runInTerminal = true,
			console = "integratedTerminal",
		},
		cmake_notifications = {
			runner = { enabled = false },
		},
	})
end

return M
