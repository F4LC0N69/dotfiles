local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--My personal ones
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts, { desc = 'Toggle Tree' })
map('n', ';', ':', opts)


--Telescope ones
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, opts, { desc = 'Telescope find files' })
map('n', '<leader>fg', builtin.live_grep, opts, { desc = 'Telescope live grep' })
map('n', '<leader>fb', builtin.buffers, opts, { desc = 'Telescope buffers' })
map('n', '<leader>fh', builtin.help_tags, opts, { desc = 'Telescope help tags' })

--lsp keybinds
map('n', 'K', vim.lsp.buf.hover, opts, { desc = 'Display hover information'})
map('n', 'gd', vim.lsp.buf.definition, opts, { desc = 'Goto Definition'})
map({ 'n', 'v' },
'<leader>ca',
vim.lsp.buf.code_action,
opts,
{ desc = 'Display hover information'})

--format
map('n', '<leader>fc', vim.lsp.buf.format, opts, { desc = 'Format Code' })
