local utils = require('utils')
local map = utils.map
local set_split_nav = utils.set_split_nav
local map_leader = utils.map_leader
local on_list = utils.on_list

map('i', 'jj', '<Esc>')

-- sane splits
set_split_nav('H')
set_split_nav('J')
set_split_nav('K')
set_split_nav('L')

-- s* to replace multiple
map('n', 's*', ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn")

-- managing fles
map_leader('w', ':update<CR>')
map_leader('W', ':wq<CR>')
map_leader('q', ':q<CR>')
map_leader('Q', ':q!<CR>')
map_leader('S', ':luafile ~/.config/nvim/init.lua<CR>')
map_leader('i', ':PyrightOrganizeImports<CR>')
map_leader('b', ':Buffers<CR>')
map_leader('y', ":let @+=expand('%')<CR>")

-- jump to beginning/end within insert mode
map('i', '<C-e>', '<C-o>$')
map('i', '<C-a>', '<C-o>0')

-- Insert a newline in normal mode
map_leader('o', 'm`o<Esc>``')
map_leader('O', 'm`O<Esc>``')

-- LSP functions
map_leader('N', vim.diagnostic.goto_prev)
map_leader('n', vim.diagnostic.goto_next)
map_leader('a', vim.lsp.buf.code_action)
map_leader('R', vim.lsp.buf.rename)
map_leader('s', vim.lsp.buf.document_symbol)
map_leader('d', vim.lsp.buf.type_definition)
map_leader('p', vim.lsp.buf.format)
map('n', 'K', vim.lsp.buf.hover)
map('n', 'gr', vim.lsp.buf.references)

local function goto_definition()
    vim.lsp.buf.definition { on_list = on_list }
end

map('n', 'gd', goto_definition)

-- Magit
map_leader('M', '<cmd>Magit<CR>')

-- Compe
local ctrl_j_behavior =
'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"'
map('i', '<C-j>', ctrl_j_behavior, { expr = true, noremap = false })
