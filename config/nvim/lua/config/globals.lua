vim.g.mapleader = ' '
-- Set the leader key to space

vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.g.netrw_liststyle = 3
-- Set netrw list style to tree view

vim.opt.relativenumber = true
-- Enable relative line numbers

vim.opt.number = true
-- Enable absolute line numbers

vim.opt.tabstop = 2
-- Set the width of a tab character to 2 spaces

vim.opt.shiftwidth = 2
-- Set the number of spaces to use for each step of (auto)indent

vim.opt.expandtab = true
-- Convert tabs to spaces when typing

vim.opt.autoindent = true
-- Enable automatic indentation

vim.opt.ignorecase = true
-- Ignore case when searching

vim.opt.smartcase = true
-- Override ignorecase if the search pattern contains uppercase letters

vim.opt.cursorline = true
-- Highlight the current line

vim.opt.termguicolors = true
-- Enable 24-bit RGB color in the terminal

vim.opt.background = 'dark'
-- Set the background color scheme to dark

vim.opt.signcolumn = 'yes'
-- Always show the sign column

vim.opt.backspace = 'indent,eol,start'
-- Allow backspacing over indent, end of line, and start of line

-- vim.opt.clipboard:append('unnamedplus')
-- Uncomment to use system clipboard (requires X11 or Wayland)

vim.opt.splitright = true
-- New splits will open to the right

vim.opt.splitbelow = true
-- New splits will open below

vim.opt.winborder = 'rounded'
