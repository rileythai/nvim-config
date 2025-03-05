return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      { "rafamadriz/friendly-snippets" },
      { "kawre/neotab.nvim" },
    },
    version = "*",
    opts = {
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-e: Hide menu
      -- C-k: Toggle signature help
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
      },
      snippets = { preset = "luasnip" },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        use_nvim_cmp_as_default = true,
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "normal",
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance.
      -- when the Rust fuzzy matcher is not available, fallback by using `implementation = "prefer_rust"`
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
  },
  {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
      tabkey = "<Tab>",
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
          ft = { "cs", "c", "cpp", "java", "vue" },
        },
        escape = {
          enabled = false,
          triggers = {},
        },
      },
    },
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "InsertEnter",
    dependencies = { "kawre/neotab.nvim" },
    opts = { enable_autosnippets = true },
    config = function()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snips/" })
      require("luasnip.loaders.from_vscode").load({
        paths = { "~/.local/share/nvim/lazy/friendly-snippets" },
        exclude = { "latex" }, -- don't want fs latex
      })
    end,
  },
}
