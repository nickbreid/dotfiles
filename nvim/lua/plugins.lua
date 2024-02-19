local fn = vim.fn;
local call = vim.call;

local Plug = fn['plug#']
call('plug#begin', '~/.config/nvim/plugged')

-- dependency for null-ls and others
Plug 'nvim-lua/plenary.nvim'

-- mason suite
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-dap'
Plug 'jose-elias-alvarez/null-ls.nvim'

-- lsp
-- Plug 'nvim-lua/lsp_extensions.nvim'
-- Make the LSP client uses FZF to display results/navigate code
Plug 'ojroques/nvim-lspfuzzy'
-- Lua gotodefinition helper
Plug 'folke/neodev.nvim' 

-- diagnostics
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

-- theme
-- Plug 'rktjmp/lush.nvim'
-- Plug 'folke/lsp-colors.nvim'
-- Plug 'sunjon/shade.nvim'
Plug 'norcalli/nvim-colorizer.lua' -- Highlights hex colors like this: #f8660d 
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'TaDaa/vimade' -- Like Shade
Plug 'machakann/vim-highlightedyank'

-- color scheme
-- Plug('folke/tokyonight.nvim', {branch = 'main'})
-- Plug 'NLKNguyen/papercolor-theme'
Plug('catppuccin/nvim', {['as'] = 'catppuccin'})
Plug('Verf/deepwhite.nvim')

-- status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

-- editing
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug('junegunn/fzf', {dir = '~/.fzf', ['do'] = './install --all'})
Plug 'junegunn/fzf.vim'
-- Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'

-- formatting
-- Plug 'mhartington/formatter.nvim'
-- Plug 'sbdchd/neoformat'
-- Plug 'brentyi/isort.vim'

-- editing functionality

-- cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

-- completion
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rafamadriz/friendly-snippets'
-- Plug 'editorconfig/editorconfig-vim'

-- rust
-- Plug 'simrat39/rust-tools.nvim'

-- git
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

-- markdown
Plug('iamcco/markdown-preview.nvim', {['do'] = 'cd app && yarn install'})

-- python
Plug 'vimjas/vim-python-pep8-indent'

call('plug#end')
