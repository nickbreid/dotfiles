local g = vim.g
local bo = vim.bo
local cmd = vim.cmd
local api = vim.api

local map = require('utils').map

g.NERDTreeIgnore = {
    ".cache", "*.swp", "*.swm", "*.swo", "*.un*", "tags",
    "*.swn", ".DS_Store", "*.min.js", "*.zip::node_modules*"
}
g.NERDTreeQuitOnOpen = 1
g.NERDTreeMinimalUI = 1
g.NERDTreeWinSize = 70

function Get_tree_command()
    local command = ""

    if bo.filetype == '' then
        command = "NERDTree"
    elseif g.NERDTree and api.nvim_eval("g:NERDTree.IsOpen()") == 1 then
        command = "NERDTreeClose"
    else
        command = "NERDTreeFind"
    end

    cmd(command)
end

map('n', '<C-n>', '<cmd>lua Get_tree_command() <CR>', {silent = true})
