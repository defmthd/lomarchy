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

-- Keymaps: Splits
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Keymaps: Splits Sizes
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = 'Split increase height' })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = 'Split decrease height' })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = 'Split increase width' })
vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = 'Split decrease width' })

-- Keymaps: Tabs
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to prev tab' })
vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

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

