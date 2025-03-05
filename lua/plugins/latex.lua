return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.vimtex_mappings_enabled = 0
    end,
  },
  {
    "nvim-treesitter",
    config = function()
      -- weird linting error here but this should work
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "python", "markdown", "lua", "vim", "julia" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          disable = { "latex" },
        },
      })
    end,
  },
}
