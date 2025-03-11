local keys = {
  { "<leader>r", "<cmd>call jukit#send#section(0)<cr>", desc = "Run current cell", silent = false, remap = true },
  {
    "<leader>pr",
    "<cmd>call jukit#splits#output()<CR>",
    desc = "Create iPython split",
    silent = false,
    remap = true,
  },
  {
    "<leader>pc",
    "<cmd>call jukit#convert#notebook_convert('jupyter-notebook')<cr>",
    desc = "Convert to/from ipynb",
  },
  { "K", "<cmd>call jukit#cells#jump_to_previous_cell()<CR>", silent = true, remap = true },
  { "J", "<cmd>call jukit#cells#jump_to_next_cell()<CR>", silent = true, remap = true },
  { "<leader>pd", "<cmd>call jukit#cells#delete()<CR>", desc = "Delete cell", silent = false, remap = true },
  {
    "<leader>px",
    "<cmd>call jukit#splits#close_output_split()<CR>",
    desc = "Close iPython split",
    silent = false,
    remap = true,
  },

  {
    "<leader>po",
    "<cmd>call jukit#cells#create_below(0)<CR>",
    desc = "Create output cell below",
    silent = false,
    remap = true,
  },
  {
    "<leader>pO",
    "<cmd>call jukit#cells#create_above(0)<CR>",
    desc = "Create output cell above",
    silent = false,
    remap = true,
  },
  {
    "<leader>pt",
    "<cmd>call jukit#cells#create_below(1)<CR>",
    desc = "Create text cell below",
    silent = false,
    remap = true,
  },
  {
    "<leader>pT",
    "<cmd>call jukit#cells#create_above(1)<CR>",
    desc = "Create text cell above",
    silent = false,
    remap = true,
  },
  { "<leader>pk", "<cmd>call jukit#cells#move_up()<CR>", desc = "Move cell up", silent = false, remap = true },
  {
    "<leader>pj",
    "<cmd>call jukit#cells#move_down()<CR>",
    desc = "Move cell down",
    silent = false,
    remap = true,
  },
  {
    "<leader>pM",
    "<cmd>call jukit#cells#merge_above()<CR>",
    desc = "Merge cell with above cell",
    silent = false,
    remap = true,
  },
  {
    "<leader>pm",
    "<cmd>call jukit#cells#merge_below()<CR>",
    desc = "Merge cell with below cell",
    silent = false,
    remap = true,
  },
  {
    "<leader>pa",
    "<cmd>call jukit#send#until_current_section()<CR>",
    desc = "Run all cells until current",
    silent = false,
    remap = true,
  },
  {
    "<leader>ph",
    "<cmd>call jukit#splits#toggle_auto_hist()",
    desc = "Toggle show history",
    silent = false,
    remap = true,
  },
  {
    "<leader>pA",
    "<cmd>call jukit#send#until_current_section()<CR>",
    desc = "Run all cells",
    silent = false,
    remap = true,
  },
  {
    "<leader>ps",
    "<cmd>call jukit#convert#save_nb_to_file(0,1,'pdf')<CR>",
    desc = "Save PDF (saved outputs)",
    silent = false,
    remap = true,
  },
  {
    "<leader>pS",
    "<cmd>call jukit#convert#save_nb_to_file(1,1,'pdf')<CR>",
    desc = "Save PDF (rerun all)",
    silent = false,
    remap = true,
  },
}

return {
  -- Jukit
  {
    "luk400/vim-jukit",
    ft = "python",
    config = function()
      for index, value in ipairs(keys) do
        vim.keymap.set("n", value[1], value[2], { desc = value.desc, silent = value.silent, remap = value.remap })
      end
    end,

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
    init = function()
      local wk = require("which-key")
      wk.add({
        { "<leader>p", group = "python" },
        { "<leaderl>", group = "latex" },
      })
    end,
  },
}
