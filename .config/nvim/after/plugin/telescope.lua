local telescope = require('telescope.builtin')
--require("telescope").load_extension("file_browser")

vim.keymap.set('n', '<C-k>', telescope.oldfiles, {})
vim.keymap.set('n', '<C-f>', telescope.find_files, {})
--vim.keymap.set('n', '<C-k>', require("telescope").extensions.file_browser.file_browser, {}) 
vim.keymap.set('n', '<C-P>', telescope.commands, {})
--vim.keymap.set('n', '<C-f>', function()
--	telescope.grep_string({search = vim.fn.input(">")});
--end)
--
--
