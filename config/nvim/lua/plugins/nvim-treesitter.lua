vim.pack.add({ 'http://github.com/nvim-treesitter/nvim-treesitter' })

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'lua',
    'ruby'
  },
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
})

