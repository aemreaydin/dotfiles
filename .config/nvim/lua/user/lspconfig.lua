local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neodev.nvim", opts = {} },
		"mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	opts = {
		inlay_hints = { enabled = true },
	},
}

M.on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap(bufnr, "n", "gi", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", opts)
end

function M.common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

function M.config()
	local lspconfig = require("lspconfig")

	local wk = require("which-key")
	wk.register({
		l = {
			name = "LSP",
			["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			["f"] = {
				"<cmd>lua vim.lsp.buf.format({async = true})<cr>",
				"Format",
			},
			["i"] = { "<cmd>LspInfo<cr>", "Info" },
			["j"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
			["h"] = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
			["k"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
			["l"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
			["q"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
			["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		},
	}, { prefix = "<leader>" })

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	require("lspconfig.ui.windows").default_options.border = "rounded"

	local servers = {
		"lua_ls",
		"jsonls",
		"clangd",
		"cmake",
		"taplo",
		"rust_analyzer",
	}
	for _, server in pairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}

		local require_ok, settings = pcall(require, "user.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup({})
		end
		lspconfig[server].setup(opts)
	end
end

return M
