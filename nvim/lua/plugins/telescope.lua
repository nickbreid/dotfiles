local api = vim.api;

local kb = require('keybindings')
local map_leader = kb.map_leader

local opts = {noremap = true, silent = true}

local find_files = [[<cmd>lua require('telescope.builtin').find_files()<cr>]]
local live_grep = [[<cmd>lua require('telescope.builtin').live_grep()<cr>]]
local buffers = [[<cmd>lua require('telescope.builtin').buffers()<cr>]]
local help_tags = [[<cmd>lua require('telescope.builtin').help_tags()<cr>]]

map_leader('t', find_files, opts)
map_leader('gg', live_grep, opts)
map_leader('gb', buffers, opts)
map_leader('gt', help_tags)

local actions = require "telescope.actions"

require('telescope').setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            n = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-y>"] = actions.send_selected_to_qflist +
                    actions.open_qflist
            }
        }
    }
}
