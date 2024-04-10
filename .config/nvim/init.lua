require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Must Haves
spec("user.colorscheme")
spec("user.devicons")
spec("user.treesitter")
spec("user.mason")
spec("user.none_ls")
spec("user.lspconfig")
spec("user.cmp")
spec("user.whichkey")
spec("user.telescope")
spec("user.comment")
spec("user.oil")
spec("user.lazygit")
spec("user.harpoon")
spec("user.unimpaired")

-- Nice To Haves
spec("user.surround")
spec("user.notify")
spec("user.overseer")
spec("user.toggleterm")
spec("user.autopairs")
spec("user.lualine")
spec("user.neoscroll")
spec("user.illuminate") -- Highlight word under cursor in file
spec("user.ufo") -- Folding
spec("user.modicator") -- Match line number color with lualine status color
spec("user.spectre")
spec("user.dressing")
spec("user.cmake")
spec("user.schemastore")
-- spec("user.bqf")
-- spec("user.chatgpt")
-- spec("user.neotest")
-- spec("user.dashboard")
-- spec("user.gitsigns")
-- spec("user.tabout")
-- spec("user.dropbar")
-- spec("user.nvim_tree")
-- spec("user.tabby")
-- spec("user.indentline")
-- spec("user.navbuddy")
-- spec("user.trouble")

require("user.lazy")
