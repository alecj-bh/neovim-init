-- test.lua
--

-- Set the status line to always show
vim.cmd[[set laststatus=2]]

C = require("tokyonight.colors").setup()

local function hs(name, fg, bg, style)
	local highlightString = "highlight %s guifg=%s guibg=%s gui=%s"
	vim.cmd(string.format(highlightString, name, fg, bg, style, fg, bg, style))
end

hs('BH_StatusPrompt', C.green, C.black, 'NONE')
hs('BH_StatusFileName', C.black, C.green1, 'NONE')
hs('BH_StatusFileNameEdge', C.green1, C.black, 'NONE')
hs('BH_StatusLineInfo', C.green1, C.black, 'NONE')
hs('BH_StatusError', C.blue6, C.error, 'bold')
hs('BH_StatusWarning', C.black, C.warning, 'bold')
hs('BH_StatusInformation', C.black, C.green, 'bold')
hs('BH_StatusHint', C.black, C.green1, 'bold')

vim.o.statusline = '%!v:lua.StatusLine()'

function StatusLine()
	local activeFlag = '%#BH_StatusPrompt#▊'

	local filename = ' %#BH_StatusFileName#' ..'%t' .. '%*'
	if vim.bo[vim.api.nvim_win_get_buf(vim.g.statusline_winid)].modified then
		filename = ' %#BH_StatusFileName# ' .. '%t' .. ' %*'
	end
  if vim.bo[vim.api.nvim_win_get_buf(vim.g.statusline_winid)].readonly then
		filename = ' %#BH_StatusFileNameEdge#%#BH_StatusFileName#' .. '%t' .. '%#BH_StatusFileNameEdge#%*'
	end

	local info =  vim.b.coc_diagnostic_info
	info = info == nil and {} or {
	 " %#BH_StatusError#   " .. info.error,
	 " %#BH_StatusWarning#   " .. info.warning,
	 " %#BH_StatusInformation# 󰋽  " .. info.information,
	 " %#BH_StatusHint#   " .. info.hint
	}
	info = '%=' .. table.concat(info, ' ') .. ' %*'

	local git = '%=%#BH_StatusLineInfo#%{fugitive#Head()}  '

	local lineinfo = '' .. '%l:%c/%L' .. '  %*'

	if vim.g.statusline_winid ~= vim.fn.win_getid() then
		return filename
	else
		return activeFlag .. filename .. info .. git .. lineinfo
	end
end
