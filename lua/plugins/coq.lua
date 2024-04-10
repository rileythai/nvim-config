-- i give up
if true then
  return {}
end

return {
  -- floating context windows, signatures
  { "ray-x/lsp_signature.nvim" },
  -- the completion engine, coq (sometimes slow, but definitely faster than cmp)
  {
    "ms-jpq/coq_nvim",
    event = "BufReadPre",
    dependencies = { "L3MON4D3/LuaSnip", "windwp/nvim-autopairs" },
    config = function()
      local lsp = require("lspconfig")
      local coq = require("coq")

      -- servers to be loaded into COQ
      local servers = {
        "basedpyright",
        "texlab",
        "lua_ls",
        "matlab_ls",
      }
      for _, srv in ipairs(servers) do
        lsp[srv].setup(coq.lsp_ensure_capabilities())
      end
    end,
    init = function()
      -- all settings (any other will override this)
      vim.g.coq_settings = {
        auto_start = "shut-up",
        display = { preview = { border = "rounded" }, icons = { mode = "short" } },
        keymap = {
          recommended = false,
          jump_to_mark = "",
          pre_select = true,
        },
        clients = {
          lsp = { enabled = true, short_name = "ls" },
          buffers = { enabled = true, short_name = "b" },
          snippets = { enabled = false },
          tmux = { enabled = false },
        },
      }
      vim.cmd("ino <silent><expr> <Esc>   pumvisible() ? '<C-e><Esc>' : '<Esc>'")
      vim.cmd("ino <silent><expr> <C-c>   pumvisible() ? '<C-e><C-c>' : '<C-c>'")
      vim.cmd("ino <silent><expr> <BS>    pumvisible() ? '<C-e><BS>'  : '<BS>' ")
      vim.cmd(
        "ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? '<C-e><CR>' : '<C-y>') : '<CR>'"
      )
      vim.cmd("ino <silent><expr> <C-f>   pumvisible() ? '<C-n>' : '<Tab>'")
      vim.cmd("ino <silent><expr> <C-b> pumvisible() ? '<C-p>' : '<BS>' ")
    end,
  },
  {
    "ms-jpq/coq.thirdparty",
    config = function()
      require("coq_3p")({
        { src = "nvimlua", short_name = "nLUA" },
        { src = "ultisnip", short_name = "snip" },
        --{ src = "copilot", short_name = "COP", accept_key = "<c-f>" },
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
          triggers = {},
        },
      },
    },
  },
}
