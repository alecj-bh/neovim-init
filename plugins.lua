vim.cmd('filetype on')

local Plug = vim.fn['plug#']
vim.call('plug#begin')
Plug "nvim-tree/nvim-web-devicons"
Plug "nvim-tree/nvim-tree.lua"
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug('willothy/nvim-cokeline', { branch= 'main' })
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


local is_picking_focus = require('cokeline.mappings').is_picking_focus
local is_picking_close = require('cokeline.mappings').is_picking_close
local get_hex = require('cokeline.hlgroups').get_hl_attr

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_3

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and require('cokeline.hlgroups').get_hl_attr('Normal', 'fg')
         or get_hex('Comment', 'fg')
    end,
    bg = function() return get_hex('ColorColumn', 'bg') end,
  },

	sidebar = {
    filetype = {'NvimTree', 'neo-tree'},
    components = {
      {
        text = function(buf)
          return buf.filetype
        end,
        fg = yellow,
        bg = function() return get_hex('NvimTreeNormal', 'bg') end,
        bold = true,
      },
    }
  },

  components = {
    {
      text = function(buffer) return (buffer.index ~= 1) and '▏' or ' ' end,
    },
    {
      text = function(buffer)
        return
          (is_picking_focus() or is_picking_close())
          and buffer.pick_letter .. ' '
           or buffer.devicon.icon
      end,
      fg = function(buffer)
        return
          (is_picking_focus() and yellow)
          or (is_picking_close() and red)
          or buffer.devicon.color
      end,
      italic = function()
        return
          (is_picking_focus() or is_picking_close())
      end,
      bold = function()
        return
          (is_picking_focus() or is_picking_close())
      end
    },
    {
      text = ' ',
    },
    {
      text = function(buffer) return buffer.filename .. '  ' end,
      bold = function(buffer) return buffer.is_focused end,
    },
  },
})

require('gitsigns').setup()
require('colorizer').setup()

vim.cmd[[colorscheme tokyonight]]

