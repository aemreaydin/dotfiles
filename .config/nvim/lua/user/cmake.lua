local M = {
	"Civitasv/cmake-tools.nvim",
}

M.config = function()
	require("cmake-tools").setup({
		cmake_build_directory = "build/${variant:buildType}",
		cmake_executor = { name = "overseer" },
		cmake_runner = { name = "toggleterm" },
		cmake_variants_message = {
			long = { show = false, max_length = 40 },
		},
		toggleterm = {
			direction = "float",
			close_on_exit = false,
			auto_scroll = true,
		},
		cmake_notifications = {
			runner = { enabled = false },
		},
	})
end

return M
