return {
  -- unload cmp et. al
  {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "saadparwaiz1/cmp_luasnip",
    enabled = false,
  },

  -- load coq
  {
    "ms-jpq/coq.nvim",
    dependencies = { "ms-jpq/coq.artifacts", "ms-jpq/coq.thirdparty" },
    init = function()
      vim.g.coq_settings.auto_start = "shut-up"
      vim.g.coq_settings.keymaps.recommended = true
    end,
  },

  --`` load third party and snipppets
  { "ms-jpq/coq.artifacts", "ms-jpq/coq.thirdparty" },
}
