local api = vim.api;

local lint = function()
    return {
        exe = "eslint",
        args = {
            "--stdin-filename", api.nvim_buf_get_name(0), "--fix", "--cache"
        },
        stdin = false
    }
end

require('formatter').setup({
    logging = false,
    filetype = {
        javascript = {lint()},
        ['javascript.jsx'] = {lint()},
        javascriptreact = {lint()},
        typescript = {lint()},
        typescriptreact = {
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
        ['typescript.tsx'] = {lint()},
        lua = {
            function()
                return {exe = "lua-format", args = {"-i"}, stdin = true}
            end
        },
        rust = {exe = "rustfmt"}
    }
})
