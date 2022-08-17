local api = vim.api
local opt = vim.opt
local fn = vim.fn

local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
local function lines_from(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do lines[#lines + 1] = line end
    return lines
end

function Set_React_Ft()
    local filename = fn.expand('%:p')
    local lines = lines_from(filename)

    local next_type = nil

    for k, v in pairs(lines) do
        if (k > 20) then break end

        local isReact = string.find(v, 'React')

        if isReact then
            next_type = 'javascriptreact'
            break
        end
    end

    opt.filetype = next_type or 'javascript'
end

api.nvim_exec([[ 
augroup filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.js lua Set_React_Ft()
augroup END
]], false)

api.nvim_exec([[ 
augroup spellcheck
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType gitcommit setlocal spell
augroup END
]], false)

-- api.nvim_exec([[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
-- augroup END
-- ]], true)
