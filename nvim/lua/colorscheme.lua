local opt = vim.opt
local cmd = vim.cmd
local custom_theme = require 'lualine.themes.auto'

-- local bg = '#FAFAFA'
-- local colorcolumn = '#e6e4df'
-- cmd("colorscheme deepwhite")

-- require('deepwhite').setup({
--     -- If you have some anti-blue light setting (f.lux, light bulb, or low blue light mode monitor),
--     -- turn it on, this will set the background color to a cooler color to prevent the background from being too warm.
--
--     -- I hard-coded this in the package code because the option wasn't working
--     low_blue_light = true,
-- })

local bg = '#eff1f5'
local colorcolumn = '#e6e9ef'

opt.background = 'light'
cmd("colorscheme catppuccin-latte")
cmd([[highlight statuslinenc guibg=]] .. bg)
cmd([[highlight statusline guibg=]] .. bg)
cmd([[highlight colorcolumn guibg=]] .. colorcolumn)

-- Change the background of middle section of Lualine
custom_theme.normal.c.bg = bg
custom_theme.insert.c.bg = bg
custom_theme.visual.c.bg = bg
custom_theme.replace.c.bg = bg
custom_theme.command.c.bg = bg
custom_theme.inactive.c.bg = bg
