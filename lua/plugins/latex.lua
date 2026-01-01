local keys = {
  { "<leader>li", "<cmd>VimtexInfo<cr>", desc = "VimTeX info", silent = false, remap = true },
  { "<leader>lr", "<cmd>VimtexCompile<cr>", desc = "Toggle auto-compile", silent = false, remap = true },
  { "<leader>lc", "<cmd>VimtexClean!<cr>", desc = "Clean working directory", silent = false, remap = true },
  { "<leader>ls", "<cmd>VimtexStopAll<cr>", desc = "Stop all compilers", silent = false, remap = true },
  { "<leader>lx", "<cmd>VimtexErrors<cr>", desc = "Inspect errors", silent = false, remap = true },
  { "<leader>ls", "<cmd>VimtexView<cr>", desc = "View document and forward search", silent = false, remap = true },
}

return {
  {
    "lervag/vimtex",
    lazy = false, -- don't lazy load, already does this
    init = function()
      vim.g.vimtex_mappings_enabled = 0
      --vim.g.latex_view_general_viewer = "zathura_simple" -- no xdotool on wayland
      vim.g.vimtex_view_method = "zathura_simple"
      vim.g.vimtex_compiler = "latexmk"
      vim.g.vimtex_fold_enabled = true
      for index, value in ipairs(keys) do
        vim.keymap.set("n", value[1], value[2], { desc = value.desc, silent = value.silent, remap = value.remap })
      end
    end,
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "lervag/vimtex",
    },
    config = function()
      require("luasnip-latex-snippets").setup()
      require("luasnip").config.setup({ enable_autosnippets = true })
    end,
  },
}
