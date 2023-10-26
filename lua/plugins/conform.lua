return {
  "stevearc/conform.nvim",
  config = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "yapf" },
      tex = { "latexindent" },
    },
    -- Set the log level.
    log_level = vim.log.levels.ERROR,
  },
}
