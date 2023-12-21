vim.o.ts = 2
vim.o.sw = 2
vim.o.relativenumber = true
vim.o.termguicolors = true

package.path = package.path .. ';' .. vim.fn.stdpath('config') .. "/?.lua"

require('plugins')
require('statusline')
require('keymaps')

