return {
  "LazyVim/LazyVim",
  opts = {
    -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
    colorscheme = "kanagawa-dragon",

    -- don't load the default settings
    defaults = {
      autocmds = false, -- lazyvim.config.autocmds
      keymaps = false, -- lazyvim.config.keymaps
      -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
    },
  },
}
