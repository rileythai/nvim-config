return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  event = "InsertEnter",
  dependencies = { "kawre/neotab.nvim" },
  opts = { enable_autosnippets = true },
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snips/" })
  end,
}
