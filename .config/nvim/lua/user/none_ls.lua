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
	local diagnostics = null_ls.builtins.diagnostics
	local completions = null_ls.builtins.completion

	local sources = {
		-- Lua
		completions.luasnip,
		formatting.stylua,
		-- C/C++
		formatting.clang_format,
		-- GLSL/HLSL
		diagnostics.glslc,
		-- YAML
		formatting.yamlfmt,
		-- JS/TS
		formatting.prettier,
		-- Bash
		formatting.shfmt,
	}

	require("null-ls").setup({
		sources = sources,
		on_attach = on_attach,
	})
end

return M
