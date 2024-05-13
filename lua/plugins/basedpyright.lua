return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          disableOrganizeImports = true,
          basedpyright = {
            analysis = {
              ignore = { "*" },
            },
          },
        },
      },
      ruff_lsp = {},
    },
  },
}
