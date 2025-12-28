local opt = vim.opt
local g = vim.g

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = 'yes'
opt.colorcolumn = ''
opt.wrap = false
opt.showmode = false

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Clipboard
opt.clipboard = 'unnamedplus'

-- Undo
opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undo'

-- Completion
opt.completeopt = 'menuone,noselect'

-- Performance
opt.timeoutlen = 300
opt.updatetime = 250
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Other
opt.mouse = 'a'
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.showtabline = 2
opt.laststatus = 3
opt.cmdheight = 1

-- Let nvim-tree hijack netrw
g.loaded_netrw = 0
g.loaded_netrwPlugin = 0
