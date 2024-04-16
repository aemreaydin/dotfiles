local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)

keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("v", "]e", ":m '>+1<CR>gv=gv", opts)
keymap("v", "[e", ":m '<-2<CR>gv=gv", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

keymap("n", "<M-l>", [[<cmd>vertical resize +5<cr>]], opts)
keymap("n", "<M-h>", [[<cmd>vertical resize -5<cr>]], opts)
keymap("n", "<M-k>", [[<cmd>horizontal resize +2<cr>]], opts)
keymap("n", "<M-j>", [[<cmd>horizontal resize -2<cr>]], opts)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
