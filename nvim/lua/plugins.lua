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
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'folke/lua-dev.nvim' -- Lua gotodefinition helper

-- diagnostics
Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

-- theme
Plug 'rktjmp/lush.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'folke/lsp-colors.nvim'
Plug 'sunjon/shade.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lukas-reineke/indent-blankline.nvim'

-- color scheme
Plug('folke/tokyonight.nvim', {branch = 'main'})

-- status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

-- nav
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug('junegunn/fzf', {dir = '~/.fzf', ['do'] = './install --all'})
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- formatting
Plug 'mhartington/formatter.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'sbdchd/neoformat'
Plug 'kkoomen/vim-doge'
Plug 'brentyi/isort.vim'

-- cmp
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'

-- completion
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'
Plug 'editorconfig/editorconfig-vim'

-- rust
Plug 'simrat39/rust-tools.nvim'

-- git
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

-- markdown
Plug('iamcco/markdown-preview.nvim', {['do'] = 'cd app && yarn install'})

-- python
Plug 'vimjas/vim-python-pep8-indent'

call('plug#end')
