require('telescope').setup {
    -- defaults = {
    --     vimgrep_arguments = { 'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
    -- },
    -- local project_actions = require("telescope._extensions.project.actions")
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
    extensions = {
        project = {
            base_dirs = {
                -- '~/dev/src',
                -- { '~/dev/src2' },
                -- { '~/dev/src3',        max_depth = 4 },
                -- { path = '~/dev/src4' },
                { path = '~/Documents', max_depth = 4 },
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true, -- default false
            -- default for on_project_selected = find project files
            on_project_selected = function(prompt_bufnr)
                --print("project selected", prompt_bufnr)
                --print(prompt_bufnr)
                -- Do anything you want in here. For example:
                require("telescope._extensions.project.actions").change_working_directory(prompt_bufnr, false)

                -- execute the following command NvimTreeFocus
                vim.cmd("NvimTreeFocus")

                --exec a research inside the nvim tree buffer and type /.md enter enter
                vim.cmd(":find *.md")
            end
        }
    }
}


--print("Loading telescope.lua")
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>o', telescope.oldfiles, {})
vim.keymap.set('n', '<leader>f', telescope.find_files, {})
--vim.keymap.set('n', '<C-k>', require("telescope").extensions.file_browser.file_browser, {})
vim.keymap.set('n', '<leader>h', telescope.commands, {})

require('telescope').load_extension('project')
--keymap for telescope-project with leader r
vim.keymap.set('n', '<leader>p', require "telescope".extensions.project.project, { silent = false })
