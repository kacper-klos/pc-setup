vim.cmd([[call plug#begin("~/.local/share/nvim/plugged")
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-tree/nvim-web-devicons'

Plug 'Abstract-IDE/Abstract-cs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mbbill/undotree'
Plug 'ThePrimeagen/harpoon'

Plug 'rcarriga/nvim-notify'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'

Plug 'numToStr/Comment.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'm-demare/hlargs.nvim'
Plug 'ray-x/lsp_signature.nvim'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'lukas-reineke/cmp-under-comparator'

Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'jay-babu/mason-nvim-dap.nvim'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-neotest/nvim-nio'
Plug 'rcarriga/nvim-dap-ui'

Plug 'GCBallesteros/jupytext.nvim'
Plug '3rd/image.nvim'
Plug 'benlubas/molten-nvim', {'do': ':UpdateRemotePlugins'} 
Plug 'GCBallesteros/NotebookNavigator.nvim'
Plug 'nvim-mini/mini.comment'
call plug#end()
]])
