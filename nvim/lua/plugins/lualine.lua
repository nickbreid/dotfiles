local custom_theme = require 'lualine.themes.auto'

-- moved this config to colorscheme.lua
-- Change the background of middle section
-- custom_theme.normal.c.bg = '#eff1f5'
-- custom_theme.inactive.c.bg = '#eff1f5'

local function blank() return ' ' end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = custom_theme,
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = {}, winbar = {} },
        ignore_focus = { 'nerdtree', 'magit' },
        always_divide_middle = true,
        globalstatus = false,
        refresh = { statusline = 1000, tabline = 1000, winbar = 1000 }
    },
    sections = {
        lualine_a = {
            {
                'mode',
                color = 'Normal',
                -- color = { bg = '#eff1f5', fg = '#bcc0cc' },
                separator = { right = '' }
            }
        },
        lualine_b = { { blank, color = 'Normal' } },
        lualine_c = {
            {
                'filename',
                color = { fg = '#e1e2e7', bg = '#9854f1' },
                separator = { left = '', right = '' }
            }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            { 'branch',      color = 'Normal' },
            { 'diagnostics', color = 'Normal' }
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
