return {
  -- disable stupid mini autopairs
  { "echasnovski/mini.pairs", enabled = false },

  -- get better autopairs
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = { map_bs = false, map_cr = false } },
}
