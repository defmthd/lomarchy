vim.g.leader = ' '

require("config.lazy")

# Telescope shortcuts
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

# NvimTree shortcuts
local nvim_tree_api = require "nvim-tree.api"
vim.keymap.set('n', '<leader>e', function()
  nvim_tree_api.tree.toggle()
end, { desc = "Toggle NvimTree" })

