local api = vim.api;

require('formatter').setup({
    logging = false,
    filetype = {
        javascript = {
            function()
                return {
                    exe = "eslint",
                    args = {
                        "--stdin-filename", api.nvim_buf_get_name(0), "--fix",
                        "--cache"
                    },
                    stdin = false
                }
            end
        },
        ['javascript.jsx'] = {
            function()
                return {
                    exe = "eslint",
                    args = {
                        "--stdin-filename", api.nvim_buf_get_name(0), "--fix",
                        "--cache"
                    },
                    stdin = false
                }
            end
        },
        javascriptreact = {
            function()
                return {
                    exe = "eslint",
                    args = {
                        "--stdin-filename", api.nvim_buf_get_name(0), "--fix",
                        "--cache"
                    },
                    stdin = false
                }
            end
        },
        lua = {
            function()
                return {exe = "lua-format", args = {"-i"}, stdin = true}
            end
        },
        rust = {exe = "rustfmt"}
    }
})
