return {
  {
    "ms-jpq/coq_nvim",
    event = "InsertEnter",
    init = function()
      vim.g.coq_settings = {
        auto_start = "shut-up",
      }
    end,
  },
  { "ms-jpq/coq.artifacts" },
  {
    "ms-jpq/coq.thirdparty",
    opts = {
      { src = "nvimlua", short_name = "nLUA" },
      { src = "vimtex", short_name = "vTEX" },
      { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
    },
  },
  {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
      tabkey = "",
      act_as_tab = true,
      behavior = "nested",
      pairs = {
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "<", close = ">" },
        { open = "$", close = "$" },
      },
      exclude = {},
      smart_punctuators = {
        enabled = false,
        semicolon = {
          enabled = false,
          ft = { "cs", "c", "cpp", "java" },
        },
        escape = {
          enabled = false,
          triggers = {}, ---@type table<string, ntab.trigger>
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "InsertEnter",
    dependencies = { "neotab.nvim" },
    keys = {
      {
        "<Tab>",
        function()
          return require("luasnip").jumpable(1) --
              and "<Plug>luasnip-jump-next"
            or "<Plug>(neotab-out)"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
    },
  },
}
