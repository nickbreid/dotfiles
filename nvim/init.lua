require('keybindings')
require('plugins')
require('options')
require('autocommands')
require('plugins.mason')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.nerd-tree')
require('plugins.telescope')

-- must come before lualine
require('colorscheme')
require('plugins.lualine')

require('plugins.treesitter')
require('plugins.autopairs') -- must come after compe
-- require('plugins.lsp_lines')
require('plugins.lspfuzzy')
require('plugins.colorizer')
require('plugins.gitsigns')
require('plugins.indent_blankline')
require('plugins.null_ls')
