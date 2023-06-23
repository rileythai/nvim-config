return {
  -- unload luasnip and relevant dependencies
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },

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
