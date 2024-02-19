local opt = vim.opt
local cmd = vim.cmd
local g = vim.g

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
opt.wildignore = { "*/node_modules/*", "*.swp", "*.swo", "*.un~" }
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"
opt.completeopt = { "menuone", "noinsert", "noselect" }
opt.splitbelow = true
opt.splitright = true
opt.showmode = false
cmd('let &colorcolumn=join(range(81,82),",")') -- grey border at right edge of buffer
-- cmd('let g:python3_host_prog="/Users/nick.reid/.pyenv/versions/app"') -- use python venv

-- Color scheme
-- opt.background = 'light'
-- cmd("colorscheme catppuccin-latte")
-- cmd([[highlight statuslinenc guibg=#eff1f5]])
-- cmd([[highlight statusline guibg=#eff1f5]])
-- cmd([[highlight colorcolumn guibg=#e6e9ef]])

-- Indent tracing character
g.indentLine_char = "┊"

-- Magit can delete untracked files
g.magit_discard_untracked_do_delete = 1

-- See: https://github.com/preservim/nerdtree/issues/1321
-- Nerdtree issue with nvim 0.8
g.NERDTreeMinimalMenu = 1

-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({ virtual_text = false, virtual_lines = true })

-- Python3 host prog
g.python3_host_prog = "/Users/nick.reid/.pyenv/versions/3.10.9/bin/python3.10"
