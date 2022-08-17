local opt = vim.opt;
local cmd = vim.cmd;
local g = vim.g;

opt.hidden = true
opt.number = true
opt.relativenumber = true
opt.cmdheight = 1
opt.updatetime = 300
opt.termguicolors = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.autoindent = true
opt.wildignore = {'*/node_modules/*', '*.swp', '*.swo', '*.un~'}
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.cursorline = true
opt.signcolumn = 'yes'
opt.clipboard = 'unnamedplus'
opt.completeopt = {'menuone', 'noinsert', 'noselect'}
opt.splitbelow = true
opt.splitright = true
opt.showmode = false;
cmd 'let &colorcolumn=join(range(101,103),",")' -- grey border at right edge of buffer
cmd 'let g:python3_host_prog="~/dev/venvs/neovim/bin/python"' -- use python venv
cmd 'let g:isort_command="isort"'

-- Color scheme
opt.background = 'light'
cmd 'colorscheme tokyonight'
cmd([[highlight statuslinenc guibg=#e1e2e7]])
cmd([[highlight statusline guibg=#e1e2e7]])

-- Indent tracing character
g.indentLine_char = '┊'

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({virtual_text = false, virtual_lines = true})
