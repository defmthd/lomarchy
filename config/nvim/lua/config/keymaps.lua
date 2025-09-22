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

-- Keymaps: Move to splits
vim.keymap.set("n", "<leader><Left>",  "<C-w>h", { desc = 'Move to left split' })
vim.keymap.set("n", "<leader><Down>",  "<C-w>j", { desc = 'Move to below split' })
vim.keymap.set("n", "<leader><Up>",    "<C-w>k", { desc = 'Move to above split' })
vim.keymap.set("n", "<leader><Right>", "<C-w>l", { desc = 'Move to right split' })

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

