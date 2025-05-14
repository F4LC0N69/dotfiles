vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local o = vim.o

o.expandtab = true   -- expand tab input with spaces characters
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 2        -- num of space characters per tab
o.shiftwidth = 2     -- spaces per indentation level
o.termguicolors = true
o.number = true
o.relativenumber = true

require("config.lazy")
require("config.keymaps")
