-- loads several nice colourschemes
return {
  -- current
  { "rose-pine/neovim", 
  name = "rose-pine",
  lazy=false,
  priority=1000,
  config= function()
	  vim.cmd([[colorscheme rose-pine]])
  end,
  },
  -- other
  { "rebelot/kanagawa.nvim", config = { theme = "dragon" } },
  { "catppuccin/nvim", name = "catppuccin" },
  { "junegunn/seoul256.vim" },
  { "shaunsingh/nord.nvim" },
}
