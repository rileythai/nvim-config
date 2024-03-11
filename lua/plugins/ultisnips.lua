return {
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
