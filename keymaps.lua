vim.g.mapleader = ','

vim.g.floaterm_shell = '/usr/local/microsoft/powershell/7/pwsh'
vim.g.floaterm_position = 'topright'
vim.g.floaterm_keymap_new    = '<leader>fw'
vim.g.floaterm_keymap_prev   = '<leader>fp'
vim.g.floaterm_keymap_next   = '<leader>fn'
vim.g.floaterm_keymap_toggle = '<leader>F'

vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<leader>N", ":CHADopen<CR>")
vim.keymap.set("n", "<leader>D", ":bd<CR>")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tf', builtin.find_files)
vim.keymap.set('n', '<leader>tg', builtin.live_grep)
vim.keymap.set('n', '<leader>tb', builtin.builtin)
vim.keymap.set('n', '<leader>th', builtin.help_tags)
vim.keymap.set('n', '<leader>ts', function() 
	builtin.lsp_workspace_symbols({ query = vim.fn.input("Query >") })
end)

--Comes from nvim_metals plugin
local function execute_command(command_params, callback)
  vim.lsp.buf_request(0, "workspace/executeCommand", command_params, function(err, result, ctx)
    if callback then
      callback(err, ctx.method, result)
    elseif err then
      print(string.format("Could not execute command: %s", err.message))
    end
  end)
end
vim.keymap.set('n', '<leader>cr', function()
	execute_command({ command = "metals.generate-bsp-config" })
end)
vim.keymap.set('n', '<leader>ci', function()
	execute_command({ command = "metals.build-import" })
end)

vim.keymap.set("n", "]b", "<Plug>(cokeline-focus-next)")
vim.keymap.set("n", "[b", "<Plug>(cokeline-focus-prev)")
vim.keymap.set("n", "]B", "<Plug>(cokeline-switch-next)")
vim.keymap.set("n", "[B", "<Plug>(cokeline-switch-prev)")
vim.keymap.set("n", "[q", ":cprev<CR>")
vim.keymap.set("n", "]q", ":cnext<CR>")
vim.keymap.set("n", "<leader>bs", "<Plug>(cokeline-pick-focus)")
vim.keymap.set("n", "<leader>bc", "<Plug>(cokeline-pick-close)")

local trouble = require('trouble')
vim.keymap.set("n", "<leader>os", function() trouble.toggle({mode = "symbols"}) end)
vim.keymap.set("n", "<leader>od", function() trouble.toggle({mode = "diagnostics"}) end)
vim.keymap.set("n", "<leader>ol", function() trouble.toggle({mode = "lsp"}) end)

local neotest = require('neotest')
vim.keymap.set("n", "<leader>x", function() neotest.summary.toggle() end)

vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
