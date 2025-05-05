local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>fp', builtin.find_files, {})
vim.keymap.set('n', '<Leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<Leader>fg', builtin.live_grep)
-- vim.keymap.set('n', '<Leader>fb', builtin.live_grep({grep_open_files=true}) <CR>, {})
