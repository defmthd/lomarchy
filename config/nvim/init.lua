-- require('config.lazy')
require('config.globals')

require('plugins.colorscheme')
require('plugins.nvim-treesitter')
require('plugins.devicons')
require('plugins.nvim-tree')
require('plugins.nvim-lualine')
require('plugins.which-key')
require('plugins.plenary')
require('plugins.telescope')

require('config.lsp')
require('config.keymaps')

vim.cmd('highlight Normal ctermbg=NONE guibg=NONE')

