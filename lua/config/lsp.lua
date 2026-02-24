vim.diagnostic.enable = true
vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = utils.icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = utils.icons.diagnostics.Warn,
      [vim.diagnostic.severity.HINT] = utils.icons.diagnostics.Hint,
      [vim.diagnostic.severity.INFO] = utils.icons.diagnostics.Info,
    },
  },
})
