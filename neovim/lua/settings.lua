local g = vim.g
local o = vim.o

vim.api.nvim_command("filetype plugin indent on")

-- General Settings
o.termguicolors = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.clipboard = "unnamedplus"
o.swapfile = false
o.splitright = true
o.splitbelow = true
o.relativenumber = true
o.number = true
o.cul = true

-- Leader key
g.mapleader = ","
g.maplocalleader = ","
g.python3_host_prog = vim.env.HOME .. "/.pyenv/versions/neovim-py3/bin/python3"
-- nodejs > 18 is required for copilot.
g.node_host_prog = vim.env.HOME .. "/.asdf/installs/nodejs/22.6.0/bin/neovim-node-host"
