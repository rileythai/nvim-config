-- bootstrap lazy.nvim, LazyVim and your plugins
package.loaded["lazyvim.config.options"] = true -- prevent loading of default options
package.loaded["cmp_nvim_lsp"] = true
require("config.autopairs")
require("config.lazy")
require("config.coqlsp")
