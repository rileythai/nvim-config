return {
  -- unload cmp et. al
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },

  -- load coq
  {
    "ms-jpq/coq.nvim",
    dependencies = { "ms-jpq/coq.artifacts", "ms-jpq/coq.thirdparty" },
  },

  -- load third party and snipppets
  -- currently not loading because this shit is ASS
  --{ "ms-jpq/coq.artifacts", "ms-jpq/coq.thirdparty" },
}
