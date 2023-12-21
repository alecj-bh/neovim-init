vim.g.mapleader = ','

vim.g.floaterm_shell = '/usr/local/microsoft/powershell/7/pwsh'
vim.g.floaterm_position = 'topright'
vim.g.floaterm_keymap_new    = '<F7>'
vim.g.floaterm_keymap_prev   = '<F8>'
vim.g.floaterm_keymap_next   = '<F9>'
vim.g.floaterm_keymap_toggle = '<F12>'

vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<leader>N", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>D", ":bd<CR>")

vim.keymap.set("n", "<leader>mn", require("nvim-tree.api").marks.navigate.next)
vim.keymap.set("n", "<leader>mp", require("nvim-tree.api").marks.navigate.prev)
vim.keymap.set("n", "<leader>ms", require("nvim-tree.api").marks.navigate.select)

vim.keymap.set("n", "<leader>cf", "<Plug>(coc-fix-current)")
vim.keymap.set("n", "<leader>cac", "<Plug>(coc-codeaction-cursor)")
vim.keymap.set("n", "<leader>cal", "<Plug>(coc-codeaction-line)")
vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction)")
vim.keymap.set("n", "<leader>cas", "<Plug>(coc-codeaction-source)")
vim.keymap.set("v", "<leader>cass", "<Plug>(coc-codeaction-selected)")
vim.keymap.set("n", "<leader>car", "<Plug>(coc-codeaction-refactor)")
vim.keymap.set("v", "<leader>carr", "<Plug>(coc-codeaction-refactor-selected)")

vim.keymap.set("n", "<leader>cd", "<Plug>(coc-definition)")
vim.keymap.set("n", "<leader>ce", "<Plug>(coc-declaration)")
vim.keymap.set("n", "<leader>ci", "<Plug>(coc-implementation)")
vim.keymap.set("n", "<leader>ct", "<Plug>(coc-type-definition)")
vim.keymap.set("n", "<leader>cr", "<Plug>(coc-references)")
vim.keymap.set("n", "<leader>cu", "<Plug>(coc-references-used)")

vim.keymap.set("n", "<leader>o", ":CocList --top outline<CR>")

vim.keymap.set("n", "]b", ":bn<CR>")
vim.keymap.set("n", "[b", ":bp<CR>")


