require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "lua", "rust", "javascript", "python"},
    highlight = {enable = true},
    indent = {enable = true},
    autopairs = {enable = true}
}
