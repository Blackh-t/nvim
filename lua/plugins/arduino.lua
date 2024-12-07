return {
  'neovim/nvim-lspconfig',
  config = function()
    require('lspconfig').arduino_language_server.setup {}
  end,
}
