local M = {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-buffer",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-path",
			event = "InsertEnter",
		},
		{
			"hrsh7th/cmp-cmdline",
			event = "InsertEnter",
		},
		{
			"saadparwaiz1/cmp_luasnip",
			event = "InsertEnter",
		},
		{
			"L3MON4D3/LuaSnip",
			event = "InsertEnter",
			dependencies = {
				"rafamadriz/friendly-snippets",
			},
			build = "make install_jsregexp",
		},
		{
			"hrsh7th/cmp-nvim-lua",
		},
		"onsails/lspkind.nvim",
	},
}

function M.config()
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	local lspkind = require("lspkind")

	--require("luasnip/loaders/from_vscode").lazy_load()

	vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

	--	local check_backspace = function()
	--		local col = vim.fn.col(".") - 1
	--		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	--	end

	cmp.setup({
		snippet = {
			expand = function(args) luasnip.lsp_expand(args.body) end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
					--elseif luasnip.jumpable(-1) then
					--luasnip.jump(-1)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{
				name = "buffer",
				option = {
					get_bufnrs = function() return vim.api.nvim_list_bufs() end,
				},
			},
			{ name = "path" },
			{ name = "luasnip" },
			{ name = "nvim_lua" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = {
				border = "rounded",
				scrollbar = false,
			},
			documentation = {
				border = "rounded",
			},
		},
		experimental = {
			ghost_text = true,
		},
		formatting = {
			format = lspkind.cmp_format({
				mode = "symbol_text",
				-- preset = "default",
				maxwidth = 50,
				ellipsis_char = "...",
				show_labelDetails = true,
			}),
		},
	})
end

return M
