return {
  "jellydn/hurl.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "hurl",
  opts = {
    debug = false,
    show_notification = false,
    mode = "split",
    formatters = {
      json = { "jq" },
      html = {
        "prettier",
        "--parser",
        "html",
      },
      xml = {
        "tidy",
        "-xml",
        "-i",
        "-q",
      },
    },
    mappings = {
      close = "q",
      next_panel = "<C-n>",
      prev_panel = "<C-p>",
    },
  },
  keys = {
    { "<leader>C", "", desc = "+Hurl" },
    { "<leader>Ca", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
    { "<leader>Cr", "<cmd>HurlRunnerAt<CR>", desc = "Run request at" },
    { "<leader>Ce", "<cmd>HurlRunnerToEntry<CR>", desc = "Run to entry" },
    { "<leader>Cm", "<cmd>HurlToggleMode<CR>", desc = "Toggle Mode" },
    { "<leader>Cv", "<cmd>HurlVerbose<CR>", desc = "Run in verbose mode" },
  },
}
