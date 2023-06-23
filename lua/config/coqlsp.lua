local lsp = require("lspconfig")
local coq = require("coq")

local servers = {
  "pyright",
  "texlab",
  "lua_ls",
  "jedi_language_server",
  "ltex",
  "matlab_ls",
  "pylsp",
  "vale_ls",
  "grammarly",
  "arduino_language_server",
  "cssls",
}

for _, srv in ipairs(servers) do
  lsp[srv].setup(coq.lsp_ensure_capabilities())
end
