return {
  "nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false }

    opts.diagnostics = {
      virtual_text = {
        severity = "Error",
      },
    }
    opts.inlay_hints = {
      enabled = false,
    }
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
