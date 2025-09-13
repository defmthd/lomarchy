return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('bashls')
      vim.lsp.enable('solargraph')
    end
  }
}
