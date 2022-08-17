local tbl_extend = vim.tbl_extend
local api = vim.api

local M = {}

------------------------------
-- UTILS
------------------------------
local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = tbl_extend('force', options, opts) end
    api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function set_split_nav(letter)
    local from = '<C-' .. letter .. '>'
    local to = '<C-W><C-' .. letter .. '>'
    map('n', from, to)
end

local function map_leader(lhs, rhs, opts) map('n', '<Space>' .. lhs, rhs, opts) end

M.map = map
M.set_split_nav = set_split_nav
M.map_leader = map_leader

------------------------------
-- BINDINGS
------------------------------

-- jj to escape
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
map_leader('p', ':Neoformat<CR>')
map_leader('i', ':PyrightOrganizeImports<CR>')

-- jump to definition
map_leader('g', 'f\'gf')
map_leader('G', 'gdf\'gf')

-- JSON.stringify surrounding word
map_leader('J', 'ysiw)iJSON.stringify<ESC>')

-- jump to beginning/end within insert mode
map('i', '<C-e>', '<C-o>$')
map('i', '<C-a>', '<C-o>0')

-- Insert a newline in normal mode
map_leader('o', 'm`o<Esc>``')

-- LSP functions
map_leader('N', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map_leader('n', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map_leader('a', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map_leader('R', '<cmd>lua vim.lsp.buf.rename()<CR>')
map_leader('s', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')

-- Magit
map_leader('M', '<cmd>Magit<CR>')

-- Compe
local ctrl_j_behavior =
    'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"'
map('i', '<C-j>', ctrl_j_behavior, {expr = true, noremap = false})

return M
