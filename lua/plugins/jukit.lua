return {
  -- Jukit
  {
    "luk400/vim-jukit",
    ft = "python",

    keys = {
      { "<leader>r", "<cmd>call jukit#send#section(0)<cr>", desc = "Run current cell" },
      { "<leader>pr", "<cmd>call jukit#splits#output()<CR>", desc = "Create iPython split & run cell" },
      { "<leader>pt", "<cmd>call jukit#splits#term()<CR>", desc = "Create iPython split" },
      {
        "<leader>pc",
        "<cmd>call jukit#convert#notebook_convert('jupyter-notebook')<cr>",
        desc = "Convert to/from ipynb",
      },
      { "<leader>po", "<cmd>call jukit#cells#create_below(0)<CR>", desc = "Create output cell below" },
      { "<leader>pO", "<cmd>call jukit#cells#create_above(0)<CR>", desc = "Create output cell above" },
      { "<leader>pt", "<cmd>call jukit#cells#create_below(1)<CR>", desc = "Create text cell below" },
      { "<leader>pT", "<cmd>call jukit#cells#create_above(1)<CR>", desc = "Create text cell above" },
      { "<leader>pk", "<cmd>call jukit#cells#move_up()<CR>", desc = "Move cell up" },
      { "<leader>pj", "<cmd>call jukit#cells#move_down()<CR>", desc = "Move cell down" },
      { "<leader>pM", "<cmd>call jukit#cells#merge_above()<CR>", desc = "Merge cell with above cell" },
      { "<leader>pm", "<cmd>call jukit#cells#merge_below()<CR>", desc = "Merge cell with below cell" },
    },

    init = function()
      vim.g.jukit_inline_plotting = 1
      vim.g.jukit_mappings = 0
      vim.g.jukit_terminal = "kitty"
      vim.g.jukit_output_new_os_window = 0
      vim.g.jukit_mpl_style = "science"
      vim.g.jukit_outhist_new_os_window = 0
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>p"] = { name = "+python" },
      },
    },
  },
}
