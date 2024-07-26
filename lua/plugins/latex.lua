return {
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
        ensure_installed = { "python", "markdown", "lua", "vim", "julia" },
        ignore_install = { "latex" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = { "latex" },
        },
      })
    end,
  },
}
