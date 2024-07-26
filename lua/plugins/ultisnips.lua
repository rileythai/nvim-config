return {
  -- add ultisnips
  {
    "SirVer/ultisnips",
    enabled = false,
    init = function()
      --vim.g.UltiSnipsExpandTrigger = "<Tab>"
      --vim.g.UltiSnipsJumpForwardTrigger = "<Tab>"
      --vim.g.UltiSnipsJumpBackwardTrigger = "<S-Tab>"
      vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snips" }
    end,
  },
  {
    "quangnguyen30192/cmp-nvim-ultisnips",
    enabled = false,
    init = function()
      local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
      local cmp = require("cmp")
      require("cmp").setup({
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        sources = {
          { name = "ultisnips" },
          -- more sources
        },
        -- recommended configuration for <Tab> people:
        mapping = {
          ["<Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
          }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end, {
            "i",
            "s", --[[ "c" (to enable the mapping in command mode) ]]
          }),
        },
      })
    end,
  },
}
