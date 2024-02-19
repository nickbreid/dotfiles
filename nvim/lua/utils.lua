-- local api = vim.api
local tbl_extend = vim.tbl_extend

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    local filetype = vim.bo.filetype;

    return vim.fn.empty(vim.fn.expand('%:t')) == 1 or filetype == 'NvimTree'
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

function M.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

function M.py_organize_imports()
    local params = {
        command = 'pyright.organizeimports',
        arguments = { vim.uri_from_bufnr(0) }
    }
    vim.lsp.buf.execute_command(params)
end

function M.ts_organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

function M.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.set_split_nav(letter)
    local from = '<C-' .. letter .. '>'
    local to = '<C-W><C-' .. letter .. '>'
    M.map('n', from, to)
end

function M.map_leader(lhs, rhs, opts) M.map('n', '<Space>' .. lhs, rhs, opts) end

function M.filter(arr, fn)
    if type(arr) ~= "table" then return arr end

    local filtered = {}
    for k, v in pairs(arr) do
        if fn(v, k, arr) then table.insert(filtered, v) end
    end

    return filtered
end

function M.filterReactDTS(value)
    return string.match(value.filename, 'react/index.d.ts') == nil
end

function M.on_list(options)
    -- https://github.com/typescript-language-server/typescript-language-server/issues/216
    local items = options.items
    if #items > 1 then items = M.filter(items, M.filterReactDTS) end

    vim.fn.setqflist({}, ' ', {
        title = options.title,
        items = items,
        context = options.context
    })
    vim.api.nvim_command('cfirst')
end

return M
