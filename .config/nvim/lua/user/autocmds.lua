vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function() vim.cmd.set("formatoptions-=cro") end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"dap-float",
		"git",
		"help",
		"man",
		"lspinfo",
		"oil",
		"toggleterm",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"chatgpt-input",
		"",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function() vim.cmd("quit") end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function() vim.cmd("tabdo wincmd =") end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	callback = function() vim.cmd("checktime") end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function() vim.highlight.on_yank({ higroup = "Visual", timeout = 100 }) end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		local status_ok, luasnip = pcall(require, "luasnip")
		if not status_ok then
			return
		end
		if luasnip.expand_or_jumpable() then
			vim.cmd([[silent! lua require("luasnip").unlink_current()]])
		end
	end,
})

local redirect_to_harpoon = function()
	local utils = require("user.utils")
	local current_buf = vim.api.nvim_get_current_buf()
	if utils.is_no_name_buf(current_buf) then
		local item = require("harpoon"):list():get(1)

		local window_id = vim.api.nvim_get_current_win()
		if item ~= nil and vim.api.nvim_win_get_config(window_id).relative == "" then
			require("harpoon"):list():select(1)
			-- Delete the no name buffer
			vim.api.nvim_buf_delete(current_buf, { force = true })
		end
	end
end
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function() vim.defer_fn(redirect_to_harpoon, 50) end,
})

-- Focus ignore types
local ignore_filetypes_focus = { "Aerial", "neo-tree" }
local ignore_buftypes_focus = { "nofile", "prompt", "popup" }

local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

vim.api.nvim_create_autocmd("WinEnter", {
	group = augroup,
	callback = function(_)
		if vim.tbl_contains(ignore_buftypes_focus, vim.bo.buftype) then
			vim.w.focus_disable = true
		else
			vim.w.focus_disable = false
		end
	end,
	desc = "Disable focus autoresize for BufType",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	callback = function(_)
		if vim.tbl_contains(ignore_filetypes_focus, vim.bo.filetype) then
			vim.b.focus_disable = true
		else
			vim.b.focus_disable = false
		end
	end,
	desc = "Disable focus autoresize for FileType",
})
