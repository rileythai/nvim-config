return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.fish_indent,
          nls.builtins.diagnostics.fish,
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt,
          nls.builtins.formatting.latexindent,
          nls.builtins.formatting.yapf,
          nls.builtins.diagnostics.mlint,
          nls.builtins.formatting.ruff,
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },

  -- add null-ls <=> mason integration
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufWritePre" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        handlers = {},
        ensure_installed = { "yapf", "ruff" },
      })
    end,
  },
}
