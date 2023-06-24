return {
  "LazyVim/LazyVim",
  opts = {
    -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
    ---@type string|fun()
    colorscheme = "kanagawa-dragon",

    -- load the default settings
    defaults = {
      autocmds = false, -- lazyvim.config.autocmds
      keymaps = false, -- lazyvim.config.keymaps
      -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
    },

    -- icons used by other plugins
    icons = {
      dap = {
        Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
        Breakpoint = " ",
        BreakpointCondition = " ",
        BreakpointRejected = { " ", "DiagnosticError" },
        LogPoint = ".>",
      },
      diagnostics = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      },
      git = {
        added = " ",
        modified = " ",
        removed = " ",
      },
      kinds = {
        Array = " ",
        Boolean = " ",
        Class = " ",
        Color = " ",
        Constant = " ",
        Constructor = " ",
        Copilot = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = " ",
        Folder = " ",
        Function = " ",
        Interface = " ",
        Key = " ",
        Keyword = " ",
        Method = " ",
        Module = " ",
        Namespace = " ",
        Null = " ",
        Number = " ",
        Object = " ",
        Operator = " ",
        Package = " ",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        String = " ",
        Struct = " ",
        Text = " ",
        TypeParameter = " ",
        Unit = " ",
        Value = " ",
        Variable = " ",
      },
    },
  },
}
