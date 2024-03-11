return {
  -- signatures (what function vars do)
  {
    "ray-x/lsp_signature.nvim",
    opts = {},
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  -- the completion engine, coq (sometimes slow)-
  {
    "ms-jpq/coq_nvim",
    event = "InsertEnter",
    dependencies = { "L3MON4D3/LuaSnip", "" },
    config = function()
      local lsp = require("lspconfig")
      local coq = require("coq")

      -- servers to be loaded into COQ
      local servers = {
        "pyright",
        "texlab",
        "lua_ls",
        "matlab_ls",
        "vale_ls",
        "grammarly",
        "ruff_lsp",
        "arduino_language_server",
        "cssls",
        "clangd",
      }
      for _, srv in ipairs(servers) do
        lsp[srv].setup(coq.lsp_ensure_capabilities())
      end
    end,
    init = function()
      local remap = vim.api.nvim_set_keymap
      local npairs = require("nvim-autopairs")

      npairs.setup({ map_bs = false, map_cr = false })

      -- all settings (any other will override this)
      vim.g.coq_settings = {
        auto_start = "shut-up",
        keymap = {
          recommended = false,
          jump_to_mark = "",
        },
        clients = { snippets = { enabled = false } },
      }

      -- these mappings are coq recommended mappings unrelated to nvim-autopairs
      remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
      remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })

      -- skip it, if you use another global object
      _G.MUtils = {}

      MUtils.CR = function()
        if vim.fn.pumvisible() ~= 0 then
          if vim.fn.complete_info({ "selected" }).selected ~= -1 then
            return npairs.esc("<c-y>")
          else
            return npairs.esc("<c-e>") .. npairs.autopairs_cr()
          end
        else
          return npairs.autopairs_cr()
        end
      end
      remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

      MUtils.BS = function()
        if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
          return npairs.esc("<c-e>") .. npairs.autopairs_bs()
        else
          return npairs.autopairs_bs()
        end
      end
      remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
    end,
  },
  {
    "ms-jpq/coq.thirdparty",
    config = function()
      require("coq_3p")({
        { src = "nvimlua", short_name = "nLUA" },
        { src = "vimtex", short_name = "vTEX" },
        { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
      })
    end,
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
  { "mendes-davi/coq_luasnip" },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    event = "InsertEnter",
    dependencies = { "neotab.nvim", "mendes-davi/coq_luasnip" },
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
