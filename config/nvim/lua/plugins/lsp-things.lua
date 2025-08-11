return {
  {
    'mason-org/mason.nvim',
    opts = {},
    config = function()
      require('mason').setup()
    end,
  },
  {
    'mason-org/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'stylua' },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({})

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require('null-ls')

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.stylua,
        },
      })

      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
    end,
  },
}
