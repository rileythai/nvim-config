-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- resizing splits
map("n", "<A-k>", require("smart-splits").resize_up, { desc = "Resize Up", remap = true })
map("n", "<A-j>", require("smart-splits").resize_down, { desc = "Resize Down", remap = true })
map("n", "<A-h>", require("smart-splits").resize_left, { desc = "Resize Left", remap = true })
map("n", "<A-l>", require("smart-splits").resize_right, { desc = "Resize Right", remap = true })

-- moving between splits
map("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Go to left window", remap = true })
map("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Go to lower window", remap = true })
map("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Go to upper window", remap = true })
map("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Go to right window", remap = true })

-- scroll forward/backward
map("n", "<C-f>", "50jzz", { desc = "Scroll forward", remap = true, silent = true })
map("n", "<C-b>", "50kzz", { desc = "Scroll forward", remap = true, silent = true })

-- swapping buffers between windows
map("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap with Buffer to left" })
map("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap with Buffer below" })
map("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap with Buffer above" })
map("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap with Buffer to right" })

-- Resize window using <ctrl> arrow keys
--map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
--map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
--map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
--map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
  map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
end
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / clear hlsearch / diff update" }
)

map({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map("n", "<leader>cF", "<cmd>ConformInfo<cr>", { desc = "Conform info" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>cl", "<cmd>:Lazy<cr>", { desc = "Lazy (plugin manager)" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Util.has("trouble.nvim") then
  map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
  map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- lazygit
map("n", "<leader>gg", function()
  Util.terminal.open({ "lazygit" }, { cwd = Util.root.get(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function()
  Util.terminal.open({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })
--map("n", "<leader>gg", "<cmd>TermExec cmd='lazygit && exit' direction='float' shading_factor=-10<cr>" , {desc = "LazyGit"})

-- quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- floating terminal
--local lazyterm = function() Util.terminal.open(nil, { cwd = Util.root.get() }) end
--map("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
--map("n", "<leader>fT", function() Util.terminal.open() end, { desc = "Terminal (cwd)" })
--map("n", "<c-/>", lazyterm, { desc = "Terminal (root dir)" })
--map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })

-- Terminal Mappings
map("n", "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Open Terminal" })
map("t", "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Close Terminal" })
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map({ "n", "t" }, "<c-_>", "<cmd>ToggleTerm<cr>", { desc = "which_key_ignore" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- Add any additional keymaps here

-- Terminal run commands

-- matlab run file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "matlab",
  callback = function()
    local fn = string.sub(vim.api.nvim_exec("echo @%", true), 1, -3)
    local cmd = string.format("matlab -batch '%s'", fn)
    map("n", "<leader>r", function()
      require("toggleterm").exec(cmd)
    end, { desc = "Run MATLAB file", buffer = true })
    map("n", "<F5>", function()
      require("toggleterm").exec(cmd)
    end, { desc = "Run MATLAB file", buffer = true })
    map("i", "<F5>", function()
      require("toggleterm").exec(cmd)
    end, { desc = "Run MATLAB file", buffer = true })
  end,
})
