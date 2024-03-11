if true then
  return {}
end

return {
  -- unload luasnip and relevant dependencies
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },

  -- add ultisnips
  {
    "SirVer/ultisnips",
    init = function()
      vim.g.UltiSnipsExpandTrigger = "<Tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snips" }
    end,
  },
}
