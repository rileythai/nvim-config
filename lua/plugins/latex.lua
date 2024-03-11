return {
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    config = function()
      require("luasnip-latex-snippets").setup()
      -- or setup({ use_treesitter = true })
      require("luasnip").config.setup({ enable_autosnippets = true })
    end,
  },
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_mappings_enabled = 0
    end,
  },
  {
    "nvim-treesitter",
    config = function()
      -- weird linting error here but this should work
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "markdown" },
        highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = { "latex" },
        },
      })
    end,
  },
}
