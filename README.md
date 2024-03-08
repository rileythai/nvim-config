# 💤 pikaa neovim config

Based on the starter template for [LazyVim](https://github.com/LazyVim/LazyVim).

## Bugs
```
   Error  20:30:36 msg_show.lua_error Error executing vim.schedule lua callback: ...2819/usr/share/nvim/runtime/lua/vim/treesitter/query.lua:259: query: invalid node type at position 94 for language latex
stack traceback:
	[C]: in function '_ts_parse_query'
	...2819/usr/share/nvim/runtime/lua/vim/treesitter/query.lua:259: in function 'get_query'
	...share/nvim/lazy/noice.nvim/lua/noice/text/treesitter.lua:7: in function 'get_query'
	...share/nvim/lazy/noice.nvim/lua/noice/text/treesitter.lua:49: in function 'fn'
	...r/share/nvim/runtime/lua/vim/treesitter/languagetree.lua:345: in function 'for_each_tree'
	...share/nvim/lazy/noice.nvim/lua/noice/text/treesitter.lua:45: in function 'highlight'
	...local/share/nvim/lazy/noice.nvim/lua/noice/text/init.lua:67: in function 'highlight'
	...ey/.local/share/nvim/lazy/nui.nvim/lua/nui/line/init.lua:58: in function 'highlight'
	...ey/.local/share/nvim/lazy/nui.nvim/lua/nui/line/init.lua:73: in function 'render'
	...ocal/share/nvim/lazy/noice.nvim/lua/noice/text/block.lua:98: in function 'render'
	...al/share/nvim/lazy/noice.nvim/lua/noice/lsp/override.lua:52: in function 'stylize_markdown'
	...ocal/share/nvim/lazy/nvim-cmp/lua/cmp/view/docs_view.lua:55: in function 'open'
	...e/riley/.local/share/nvim/lazy/nvim-cmp/lua/cmp/view.lua:292: in function 'callback'
	.../.local/share/nvim/lazy/nvim-cmp/lua/cmp/utils/async.lua:138: in function ''
	vim/_editor.lua: in function <vim/_editor.lua:0>
```
