local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 13,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})


local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

function _lazygit()
	lazygit:toggle()
end

local node = Terminal:new({ cmd = "node", hidden = true })

function _node()
	node:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })

function _ncdu()
	ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _htop()
	htop:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true })

function _python3()
	python:toggle()
end

