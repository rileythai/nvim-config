return {
  -- unload luasnip and relevant dependencies
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_mappings_enabled = 0
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = { "latex" },
        },
        --other treesitter settings
      })
    end,
  },

  -- add ultisnips
  {
    "SirVer/ultisnips",
    init = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<S-tab>"
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snips" }
    end,
  },
}
