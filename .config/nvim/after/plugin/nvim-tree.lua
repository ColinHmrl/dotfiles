--print("nvim-tree.lua")
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
--vim.opt.termguicolors = true





local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- set selected file as nvim tree root using api.tree.change_root_to_node()

    vim.keymap.set("n", "s",       api.tree.change_root_to_node, opts("change root to selected file"))
    vim.keymap.set('n', '<CR>',    function()
        api.node.open.edit()
        
        local node = api.tree.get_node_under_cursor()
        --if node type different from directory the api.tree.close()
        if node.type ~= 'directory' then
            api.tree.close()
        end

        --local previous_buf = vim.api.nvim_get_current_buf()
        --local previous_path = vim.api.nvim_buf_get_name(previous_buf)
        --if vim.fn.isdirectory(opts.path) == 1 then
        --    api.tree.close()
        --end
    end,opts('Open'))

    vim.keymap.set('n', '<Tab>',   api.node.open.preview,               opts('Open Preview'))
    vim.keymap.set('n', 'a',       api.fs.create,                       opts('Create File Or Directory'))
    vim.keymap.set('n', 'd',       api.fs.remove,                       opts('Delete'))
    vim.keymap.set('n', 'E',       api.tree.expand_all,                 opts('Expand All'))
    vim.keymap.set('n', 'r',       api.tree.collapse_all,                       opts('Rename'))

    
    --vim.keymap.set('n', '<leader>e', api.tree.close , {})



end

-- pass to setup along with your other options
require("nvim-tree").setup {
    ---
    on_attach = my_on_attach,
    ---
    -- make root directory changeable 
    update_cwd = true,

    filters = {
        dotfiles = false,
        git_ignored = false,
    }    
}


vim.keymap.set('n', '<leader>e', function()
    --we need to know if the file tree is focused, we can achieve this by checking if the current buffer is nvimtree
    local view = require'nvim-tree.view'
    local api = require'nvim-tree.api'
    local bufnr = view.get_bufnr()
    local is_focused = bufnr == vim.api.nvim_get_current_buf()
    if  is_focused then
        api.tree.close()
    else
        api.tree.open()
    end

end, {})

require("nvim-web-devicons").refresh()

