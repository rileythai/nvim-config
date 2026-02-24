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
      python = {
        "ruff_fix", -- linter
        "ruff_format", -- main format
        "ruff_organize_imports", -- organize imports
      },
      tex = { "latexindent" },
      fortran = { "fprettify" },
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    -- Set the log level.
    log_level = vim.log.levels.ERROR,
  },
}
