vim.g.leader = ' '

vim.g.netrw_liststyle = 3

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.signcolumn = 'yes'

vim.opt.backspace = 'indent,eol,start'

-- vim.opt.clipboard:append('unnamedplus')

vim.opt.splitright = true
vim.opt.splitbelow = true

require('config.lazy')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local nvim_tree_api = require('nvim-tree.api')
vim.keymap.set('n', '<leader>e', function()
  nvim_tree_api.tree.toggle()
end, { desc = 'Toggle NvimTree' })

vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')

