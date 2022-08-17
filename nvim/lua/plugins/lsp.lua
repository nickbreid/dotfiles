local nvim_lsp = require 'lspconfig'

-- local python_root_files = {
--     'WORKSPACE', 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt',
--     'Pipfile', 'pyrightconfig.json'
-- }
local function organize_imports()
    local params = {
        command = 'pyright.organizeimports',
        arguments = {vim.uri_from_bufnr(0)}
    }
    vim.lsp.buf.execute_command(params)
end

nvim_lsp.pyright.setup {
    -- root_dir = nvim_lsp.util.root_pattern(unpack(python_root_files))
    commands = {
        PyrightOrganizeImports = {
            organize_imports,
            description = 'Organize Imports'
        }
    },
    settings = {
        pyright = {
            disableOrganizeImports = false,
            disableLanguageServices = false,
            verboseOutput = true
        },
        python = {
            -- venvPath = "$HOME/dev/venvs/neovim/bin/",
            -- analysis = {
            --     logLevel = "Information",
            --     stubPath = "$HOME/Documents/typings",
            --     extraPaths = {},
            --     typeshedPaths = {},
            --     diagnosticMode = "workspace",
            --     autoSearchPaths = true,
            --     typeCheckingMode = "off",
            --     autoImportCompletions = true,
            --     useLibraryCodeForTypes = true,
            --     diagnosticSeverityOverrides = {}
            -- }
        }
    }
};

local luadev = require("lua-dev").setup({
    library = {
        vimruntime = true, -- runtime path
        types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
        plugins = true -- installed opt or start plugins in packpath
        -- you can also specify the list of plugins to make available as a workspace library
        -- plugins = {"nvim-treesitter", "plenary.nvim", "telescope.nvim"}
    },
    runtime_path = true, -- enable this to get completion in require strings. Slow!
    -- pass any additional options that will be merged in the final lsp config
    lspconfig = {
        cmd = {"lua-language-server"}
        -- on_attach = ...
    }
})

require'lspconfig'.sumneko_lua.setup(luadev)
nvim_lsp.tsserver.setup {};
nvim_lsp.bashls.setup {};
nvim_lsp.solargraph.setup {};

local rust_tools_opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = ""
        }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {command = "clippy"}
            }
        }
    }
}

require('rust-tools').setup(rust_tools_opts)

local cmp = require 'cmp'
cmp.setup({
    -- Enable LSP snippets
    snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })
    },

    -- Installed sources
    sources = {
        {name = 'nvim_lsp'}, {name = 'vsnip'}, {name = 'path'},
        {name = 'buffer'}
    }
})

-- local capabilities = lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

-- local function organize_imports()
--     local params = {
--         command = "_typescript.organizeImports",
--         arguments = {api.nvim_buf_get_name(0)},
--         title = ""
--     }
--     lsp.buf.execute_command(params)
-- end

-- local setupConfigs = {
--     diagnosticls = {
--         root_dir = nvim_lsp.util.root_pattern('.git', fn.getcwd()),
--         filetypes = {"javascript", "javascript.jsx"},
--         init_options = {
--             filetypes = {
--                 javascript = "eslint",
--                 ["javascript.jsx"] = "eslint",
--                 javascriptreact = "eslint",
--                 typescriptreact = "eslint"
--             },
--             linters = {
--                 eslint = {
--                     sourceName = "eslint",
--                     command = "./node_modules/.bin/eslint",
--                     rootPatterns = {".git"},
--                     debounce = 100,
--                     args = {
--                         "--stdin", "--stdin-filename", "%filepath", "--format",
--                         "json"
--                     },
--                     parseJson = {
--                         errorsRoot = "[0].messages",
--                         line = "line",
--                         column = "column",
--                         endLine = "endLine",
--                         endColumn = "endColumn",
--                         message = "${message} [${ruleId}]",
--                         security = "severity"
--                     },
--                     securities = {[2] = "error", [1] = "warning"}
--                 }
--             }
--         }
--     },
--     typescript = {
--         capabilities = capabilities,
--         init_options = {usePlaceholders = true},
--         commands = {
--             OrganizeImports = {
--                 organize_imports,
--                 description = "Organize Imports"
--             }
--         }
--     }
-- }

-- local function setup_servers()
--     lspinstall.setup()
--     local servers = lspinstall.installed_servers()
--     for _, server in pairs(servers) do
--         local config = {};
--         if setupConfigs[server] then config = setupConfigs[server] end
--         nvim_lsp[server].setup(config)
--     end
-- end

-- setup_servers()

-- require'lspinstall'.setup() -- important

-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   require'lspconfig'[server].setup{}
-- end

-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- lspinstall.post_install_hook = function()
--     setup_servers() -- reload installed servers
--     cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

-- local lspfuzzy = require 'lspfuzzy'
-- lspfuzzy.setup {} -- Make the LSP client use FZF instead of the quickfix list
