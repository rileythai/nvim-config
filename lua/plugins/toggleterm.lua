return {
  -- add toggleterm
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = {
      size = 13,
      open_mapping = [[<c-/>]],
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = -50,
      start_in_insert = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      float_opts = {
        border = "double",
      },
    },
  },
}
