if true then
  return {}
end

local lsp = require("lspconfig")
local coq = require("coq")

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
