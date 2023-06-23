-- bootstrap lazy.nvim, LazyVim and your plugins
package.loaded["lazyvim.config.options"] = true -- prevent loading of default options
require("config.autopairs")
require("config.lazy")
require("config.coqlsp")
