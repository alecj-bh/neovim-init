vim.cmd('filetype on')

local Plug = vim.fn['plug#']
vim.call('plug#begin')
-- File browser
Plug('ms-jpq/chadtree', {branch= 'chad', ['do']= 'python3 -m chadtree deps'})

-- Status line
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lua/plenary.nvim'

-- Buffer line
Plug('willothy/nvim-cokeline', { branch= 'main' })

-- Terminal 
Plug 'voldikss/vim-floaterm'

-- Color and style
Plug 'norcalli/nvim-colorizer.lua'
Plug('folke/tokyonight.nvim', { branch= 'main' })
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-tree/nvim-web-devicons'

-- File finder
-- Plug 'kien/ctrlp.vim'
Plug('nvim-telescope/telescope.nvim', { branch= '0.1.x' }) -- brew insall ripgrip
Plug('nvim-treesitter/nvim-treesitter', {['do']=':TSUpdate'})

-- Git
Plug 'tpope/vim-fugitive'

-- LSP and completion
-- Plug('neoclide/coc.nvim', {branch= 'release'})
Plug('ms-jpq/coq_nvim', {branch= 'coq'})
Plug('ms-jpq/coq.artifacts', {branch= 'artifacts'})
Plug('ms-jpq/coq.thirdparty', {branch= '3p'})
Plug('neovim/nvim-lspconfig')

-- REPL
Plug('Vigemus/iron.nvim')

vim.call('plug#end')

--- COQ ----
vim.g.coq_settings = {
	auto_start = true
}

local lsp = require 'lspconfig'
local coq = require "coq"

lsp.jdtls.setup(coq.lsp_ensure_capabilities()) -- brew install jdtls
lsp.metals.setup(coq.lsp_ensure_capabilities()) -- brew install coursier; coursier setup; coursier install metals
lsp.pyright.setup{ settings = {python = {pythonPath = '/opt/homebrew/bin/python3.11'}}}

require('coq_3p') {
	{ src = "bc", short_name = "MATH", precision = 6 },
	{ src = "nvimlua", short_name = "nLUA", conf_only = true },
	{ src = "repl", sh = "zsh", shell = { p = "perl", n = "node"}, max_lines = 99, deadline = 500, unsafe = { "rm", "poweroff", "mv" } }
}


--- cokeline ---
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

--- Iron ----
local iron = require("iron.core")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      python = {
        command = { "python3.11" },  -- or { "ipython", "--no-autoindent" }
        format = require("iron.fts.common").bracketed_paste_python
      }
    },
    -- How the repl window will be displayed
    -- See below for more information
    -- repl_open_cmd = require('iron.view').bottom(40),
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sc",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_paragraph = "<space>sp",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = false})

--- Folding ---
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldnestmax = 3
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 0
