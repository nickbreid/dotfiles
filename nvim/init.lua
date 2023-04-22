-- ./lua/keybindings.lua
require('keybindings')

-- ./lua/plugins.lua
require('plugins')

-- ./lua/options.lua
require('options')

-- ./lua/autocommands.lua
require('autocommands')

-- ./lua/plugins/nerd-tree.lua
require('plugins.nerd-tree')

-- ./lua/plugins/telescope.lua
require('plugins.telescope')

-- ./lua/plugins/lsp.lua
require('plugins.lsp')

-- ./lua/plugins/formatter.lua
require('plugins.formatter')

-- ./lua/plugins/shade.lua
require('plugins.shade')

-- ./lua/plugins/lualine.lua
require('plugins.lualine')

-- ./lua/plugins/treesitter.lua
require('plugins.treesitter')

-- ./lua/plugins/autopairs.lua
require('plugins.autopairs') -- must come after compe

-- ./lua/plugins/lsp_lines.lua
require('plugins.lsp_lines')

-- ./lua/plugins/mason.lua
require('plugins.mason')

require('colorizer').setup()
require('gitsigns').setup()
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
