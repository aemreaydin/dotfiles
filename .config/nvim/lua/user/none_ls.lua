local M = {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

function M.config()
	local null_ls = require("null-ls")

	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local function on_attach(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ async = false })
				end,
			})
		end
	end

	local formatting = null_ls.builtins.formatting
	local completion = null_ls.builtins.completion
	local diagnostics = null_ls.builtins.diagnostics

	local sources = {
		-- Lua
		completion.luasnip,
		formatting.stylua,
		-- C/C++
		diagnostics.cmake_lint,
		formatting.clang_format,
		formatting.cmake_format,
		-- GLSL/HLSL
		diagnostics.glslc,
	}

	require("null-ls").setup({
		sources = sources,
		on_attach = on_attach,
	})
end

return M
