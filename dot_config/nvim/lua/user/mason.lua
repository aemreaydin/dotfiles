local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
	},
}

function M.config()
	local servers = {
		"clangd",
		"cmake",
		"glsl_analyzer",
		"lua_ls",
		"rust_analyzer",
		"taplo",
		"tsserver",
		"yamlls",
		"jsonls",
		"angularls",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})
end

return M
