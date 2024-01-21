-- simple ctrl + j mapped to :HopWord command 
vim.keymap.set('n', '<leader>j', function ()
  vim.cmd('HopWord')
end)
