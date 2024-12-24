local keys = {
  { "<leader>aa", "<cmd>lua require('avante').toggle()<cr>", desc = "Toggle Avante", remap = true },
  { "<leader>af", "<cmd>lua require('avante').format()<cr>", desc = "Format current buffer", remap = true },
  { "<leader>ad", "<cmd>lua require('avante').diagnostics()<cr>", desc = "Show diagnostics", remap = true },
  { "<leader>ac", "<cmd>lua require('avante').code_action()<cr>", desc = "Code action", remap = true },
  { "<leader>ar", "<cmd>lua require('avante').rename()<cr>", desc = "Rename symbol", remap = true },
  {
    "<leader>as",
    "<cmd>lua require('telescope').extensions.avante.search()<cr>",
    desc = "Search with Avante",
    remap = true,
  },

  -- Navigation commands
  { "<leader>ag", "<cmd>lua require('avante').goto_definition()<cr>", desc = "Go to definition", remap = true },
  { "<leader>ai", "<cmd>lua require('avante').goto_implementation()<cr>", desc = "Go to implementation", remap = true },
  {
    "<leader>at",
    "<cmd>lua require('avante').goto_type_definition()<cr>",
    desc = "Go to type definition",
    remap = true,
  },
  { "<leader>ar", "<cmd>lua require('avante').references()<cr>", desc = "Find references", remap = true },

  -- Workspace management
  { "<leader>aw", "<cmd>lua require('avante').workspace_symbols()<cr>", desc = "Workspace symbols", remap = true },
  { "<leader>al", "<cmd>lua require('avante').workspace_list()<cr>", desc = "List workspaces", remap = true },
  { "<leader>an", "<cmd>lua require('avante').workspace_new()<cr>", desc = "New workspace", remap = true },

  -- Document symbols and structure
  { "<leader>ao", "<cmd>lua require('avante').document_symbols()<cr>", desc = "Document symbols", remap = true },
  { "<leader>ah", "<cmd>lua require('avante').hover()<cr>", desc = "Hover documentation", remap = true },

  -- Diagnostic navigation
  { "<leader>aj", "<cmd>lua require('avante').next_diagnostic()<cr>", desc = "Next diagnostic", remap = true },
  { "<leader>ak", "<cmd>lua require('avante').prev_diagnostic()<cr>", desc = "Previous diagnostic", remap = true },
}

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "folke/which-key.nvim",
    --- The below dependencies are optional,
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    mappings = {
      --- @class AvanteConflictMappings
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<S-CR>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
  },

  config = function()
    local wk = require("which-key")
    vim.opt.laststatus = 3
    require("avante").setup({
      -- Default configuration options
      auto_format = false,
      format_on_save = false,
      show_diagnostics = true,
      show_signs = true,
      virtual_text = true,
      update_in_insert = false,
    })

    -- Set up keymaps goup name
    wk.add({ "<leader>a", group = "avante" })
  end,
}
