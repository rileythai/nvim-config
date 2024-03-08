return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "yapf" },
      tex = { "latexindent" },
    },
    format_on_save = { lsp_fallback = true, timeout_ms = 10000 },
    -- Set the log level.
    log_level = vim.log.levels.ERROR,
  },
}
