return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('bashls')
      vim.lsp.enable('docker_compose_language_service')
      vim.lsp.enable('jsonls')
      vim.lsp.enable('solargraph')
    end
  }
}
