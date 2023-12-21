vim.cmd('filetype on')

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug "nvim-tree/nvim-web-devicons"
Plug "nvim-tree/nvim-tree.lua"
Plug 'feline-nvim/feline.nvim'
Plug 'willothy/nvim-cokeline'
Plug 'voldikss/vim-floaterm'
Plug('folke/tokyonight.nvim', { branch= 'main' })
Plug 'kien/ctrlp.vim'
Plug('neoclide/coc.nvim', {branch= 'release'})
Plug 'lewis6991/gitsigns.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-fugitive'
vim.call('plug#end')

require("nvim-tree").setup({
	actions = {
		change_dir = {
			global = true
		}
	}
})
require('cokeline').setup()
require('gitsigns').setup()
require('colorizer').setup()

vim.cmd[[colorscheme tokyonight]]

