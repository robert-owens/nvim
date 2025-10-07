-- Neovim options and settings
local opt = vim.opt
local g = vim.g

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Editor behavior
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.linebreak = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Files
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.config/nvim/undo")

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.conceallevel = 0
opt.pumheight = 10
