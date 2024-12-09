-- Custom code snippets for different purposes

-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Appearance of diagnostics
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    -- Add a custom format function to show error codes
    format = function(diagnostic)
      -- Finn posisjonen til første forekomst av "-'" i meldingen
      local end_pos = string.find(diagnostic.message, '-')

      -- Hvis "-'" finnes, ta substringen fra starten av meldingen til dette punktet
      if end_pos then
        return string.sub(diagnostic.message, 1, end_pos - 1) -- -1 for å unngå å inkludere "-'"
      end

      -- Hvis "-'" ikke finnes, vis hele meldingen
      return string.format('%s', diagnostic.message)
    end,
  },
  severity_sort = true, -- Sorter etter alvorlighetsgrad
  underline = true,
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
  -- Make diagnostic background transparent
  on_ready = function()
    vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'
  end,
}

-- Highlight on yanked
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
