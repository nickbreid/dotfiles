local gl = require('galaxyline')
local gls = gl.section
local condition = require 'galaxyline.condition';
local utils = require('utils')

gl.short_line_list = {'defx', 'packager', 'vista'}
local hsl = function(el) return el end;

local foreground = hsl("#e8e8d3")
local background = hsl("#151515")
local grey = hsl("#888888")
local grey_one = hsl("#1c1c1c")
local grey_two = hsl("#f0f0f0")
local grey_three = hsl("#333333")
local regent_grey = hsl("#9098A0")
local scorpion = hsl("#606060")
local cod_grey = hsl("#101010")
local tundora = hsl("#404040")
local zambezi = hsl("#605958")
local silver_rust = hsl("#ccc5c4")
local silver = hsl("#c7c7c7")
local alto = hsl("#dddddd")
local gravel = hsl("#403c41")
local boulder = hsl("#777777")
local cocoa_brown = hsl("#302028")
local grey_chateau = hsl("#a0a8b0")
local bright_grey = hsl("#384048")
local shuttle_grey = hsl("#535d66")
local mine_shaft = hsl("#1f1f1f")
local temptress = hsl("#40000a")

local bayoux_blue = hsl("#556779")
local total_white = hsl("#ffffff")
local total_black = hsl("#000000")
local cadet_blue = hsl("#b0b8c0")
local perano = hsl("#b0d0f0")
local wewak = hsl("#f0a0c0")
local mantis = hsl("#70b950")
local raw_sienna = hsl("#cf6a4c")
local highland = hsl("#799d6a")
local hoki = hsl("#668799")
local green_smoke = hsl("#99ad6a")
local costa_del_sol = hsl("#556633")
local biloba_flower = hsl("#c6b6ee")
local morning_glory = hsl("#8fbfdc")
local goldenrod = hsl("#fad07a")
local ship_cove = hsl("#8197bf")
local koromiko = hsl("#ffb964")
local brandy = hsl("#dad085")
local old_brick = hsl("#902020")
local dark_blue = hsl("#0000df")
local ripe_plum = hsl("#540063")
local casal = hsl("#2D7067")
local purple = hsl("#700089")
local tea_green = hsl("#d2ebbe")
local dell = hsl("#437019")
local calypso = hsl("#2B5B77")
-- Colors
local colors = {
    bg = "#151515",
    fg = "#e8e8d3",
    section_bg = "#151515",
    yellow = '#f1fa8c',
    cyan = '#8be9fd',
    green = '#50fa7b',
    orange = '#ffb86c',
    magenta = '#ff79c6',
    blue = '#8be9fd',
    red = '#ff5555',
    goldenrod = "#fad07a"
}

-- Local helper functions
local buffer_not_empty = function() return condition.buffer_not_empty(); end

local is_not_nvim_tree = function()
    local filetype = vim.bo.filetype

    return filetype ~= 'NvimTree'
end

local is_nvim_tree = function()
    local filetype = vim.bo.filetype

    return filetype == 'NvimTree'
end

local in_git_repo = function()
    local vcs = require('galaxyline.provider_vcs')
    local branch_name = vcs.get_git_branch()

    return branch_name ~= nil
end

local checkwidth =
    function() return utils.has_width_gt(40) and in_git_repo() end

local mode_color = function()
    local mode_colors = {
        n = colors.cyan,
        i = colors.green,
        c = colors.orange,
        V = colors.magenta,
        [''] = colors.magenta,
        v = colors.magenta,
        R = colors.red
    }

    local color = mode_colors[vim.fn.mode()]

    if color == nil then color = colors.red end

    return color
end

-- Left side
gls.left[1] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'Normal',
                i = 'Insert',
                c = 'Command',
                V = 'Visual',
                [''] = 'Visual',
                v = 'Visual',
                R = 'Replace'
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color())
            local alias_mode = alias[vim.fn.mode()]
            if alias_mode == nil then alias_mode = vim.fn.mode() end
            return ' ' .. alias_mode .. ' '
        end,
        condition = is_not_nvim_tree,
        highlight = {colors.bg}
    }
}
gls.left[2] = {
    FileName = {
        provider = 'FileName',
        condition = buffer_not_empty and is_not_nvim_tree,
        highlight = {foreground, background}
    }
}
gls.left[3] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.green, background}
    }
}
gls.left[4] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.orange, background}
    }
}
gls.left[5] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        icon = ' ',
        highlight = {colors.red, background}
    }
}
gls.left[6] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, background}
    }
}
gls.left[7] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.orange, background}
    }
}
gls.left[8] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue, background}
    }
}

-- Right side
-- gls.right[1] = {
--     FileFormat = {
--         provider = function() return vim.bo.filetype end,
--         condition = is_not_nvim_tree,
--         highlight = {colors.fg, colors.section_bg}
--     }
-- }
gls.right[1] = {
    GitBranch = {
        provider = function()
            local vcs = require('galaxyline.provider_vcs')
            local branch_name = vcs.get_git_branch()
            return branch_name or '' .. " "
        end,
        condition = in_git_repo and is_not_nvim_tree,
        highlight = {foreground, background}
    }
}

-- Short status line
gls.short_line_left[1] = {
    Whitespace = {
        provider = function() return '' end,
        condition = is_not_nvim_tree,
        highlight = {foreground, background}
    }
}
gls.short_line_left[2] = {
    BufferType = {
        provider = 'FileName',
        condition = is_not_nvim_tree,
        highlight = {green_smoke, background}
    }
}
gls.short_line_left[3] = {
    Whitespace = {
        provider = function() return '' end,
        condition = is_nvim_tree,
        highlight = {green_smoke, background}
    }
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
