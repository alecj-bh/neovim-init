vim.g.mapleader = ','

vim.g.floaterm_shell = '/usr/local/microsoft/powershell/7/pwsh'
vim.g.floaterm_position = 'topright'
vim.g.floaterm_keymap_new    = '<leader>fw'
vim.g.floaterm_keymap_prev   = '<leader>fp'
vim.g.floaterm_keymap_next   = '<leader>fn'
vim.g.floaterm_keymap_toggle = '<leader>ft'

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

vim.keymap.set("n", "]b", "<Plug>(cokeline-focus-next)")
vim.keymap.set("n", "[b", "<Plug>(cokeline-focus-prev)")
vim.keymap.set("n", "]B", "<Plug>(cokeline-switch-next)")
vim.keymap.set("n", "[B", "<Plug>(cokeline-switch-prev)")
vim.keymap.set("n", "<leader>bs", "<Plug>(cokeline-pick-focus)")
vim.keymap.set("n", "<leader>bc", "<Plug>(cokeline-pick-close)")


