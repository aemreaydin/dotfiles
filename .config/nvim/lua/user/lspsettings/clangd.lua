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
}
