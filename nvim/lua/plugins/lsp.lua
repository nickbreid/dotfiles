local lspconfig = require("lspconfig")
local lsp_options = require("plugins.lsp_options")
local neodev = require("neodev")

-- neodev must be setup before lspconfig
neodev.setup({})

lspconfig.pyright.setup(lsp_options.pyright)
lspconfig.lua_ls.setup({
	settings = { Lua = { completion = { callSnippet = "Replace" } } },
})
lspconfig.tsserver.setup(lsp_options.tsserver)
lspconfig.bashls.setup({})
lspconfig.eslint.setup(lsp_options.eslint)
lspconfig.groovyls.setup({})
