vim.cmd([[call plug#begin("~/.local/share/nvim/plugged")

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', {'tag': '0.1.8'}
Plug 'Abstract-IDE/Abstract-cs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ThePrimeagen/harpoon'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v4.x'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'nvimtools/none-ls.nvim'
Plug 'jay-babu/mason-null-ls.nvim'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rcarriga/nvim-notify'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'Vigemus/iron.nvim'

call plug#end()
]])
