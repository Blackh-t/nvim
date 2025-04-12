return {
  {
    'nvim-flutter/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('flutter-tools').setup {}

      -- Autoformat ved lagring
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.dart',
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end,
  },
}
