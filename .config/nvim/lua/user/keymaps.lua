local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

keymap("n", "<A-j>", ":m .+1<CR>==", opts) -- move line up(n)
keymap("n", "<A-k>", ":m .-2<CR>==", opts) -- move line down(n)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- move line up(v)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- move line down(v)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)
