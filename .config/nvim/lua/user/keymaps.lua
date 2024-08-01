function SetKeymap(mode, lhs, rhs, desc) vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, desc = desc }) end

SetKeymap("n", "<Space>", "", "")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

SetKeymap("n", "<leader>sr", ":%s/<C-r><C-w>//gi<Left><Left>", "Replace all occurences under cursor")
SetKeymap("n", "<C-l>", "<C-w>l", "(Window) Move Right")
SetKeymap("n", "<C-h>", "<C-w>h", "(Window) Move Left")
SetKeymap("n", "<C-k>", "<C-w>k", "(Window) Move Up")
SetKeymap("n", "<C-j>", "<C-w>j", "(Window) Move Down")

-- keymap("i", "jk", "<ESC>", opts)
-- keymap("i", "kj", "<ESC>", opts)

SetKeymap("n", "YY", "<cmd>%y<CR>", "Yank file")

SetKeymap("n", "n", "nzz", "")
SetKeymap("n", "N", "Nzz", "")
SetKeymap("n", "*", "*zz", "")
SetKeymap("n", "#", "#zz", "")
SetKeymap("n", "g*", "g*zz", "")
SetKeymap("n", "g#", "g#zz", "")

SetKeymap("v", "]e", ":m '>+1<CR>gv=gv", "Move Line Down")
SetKeymap("v", "[e", ":m '<-2<CR>gv=gv", "Move Line Up")

SetKeymap("v", "<", "<gv", "Indent")
SetKeymap("v", ">", ">gv", "Dedent")

SetKeymap({ "n", "o", "x" }, "<s-h>", "^", "Go to start of line")
SetKeymap({ "n", "o", "x" }, "<s-l>", "g_", "Go to end of line")

SetKeymap("n", "<M-l>", [[<cmd>vertical resize +5<cr>]], "Vertical Resize (+)")
SetKeymap("n", "<M-h>", [[<cmd>vertical resize -5<cr>]], "Vertical Resize (-)")
SetKeymap("n", "<M-k>", [[<cmd>horizontal resize +2<cr>]], "Horizontal Resize (+)")
SetKeymap("n", "<M-j>", [[<cmd>horizontal resize -2<cr>]], "Horizontal Resize (-)")

SetKeymap("t", "<C-;>", "<C-\\><C-n>", "")
