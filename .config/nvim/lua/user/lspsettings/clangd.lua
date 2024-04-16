return {
	filetypes = { "h", "hpp", "c", "cpp", "cc", "objc", "objcpp" },
	cmd = { "clangd", "--offset-encoding=utf-16", "--background-index" },
	single_file_support = true,
	root_dir = require("lspconfig").util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
	on_new_config = function(new_config, _)
		local status, cmake = pcall(require, "cmake-tools")
		if status then
			cmake.clangd_on_new_config(new_config)
		end
	end,
}
