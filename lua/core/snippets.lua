-- Custom code snippets for different purposes

-- Prevent LSP from overwriting treesitter color settings
-- https://github.com/NvChad/NvChad/issues/1907
vim.highlight.priorities.semantic_tokens = 95 -- Or any number lower than 100, treesitter's priority level

-- Appearance of diagnostics
vim.diagnostic.config {
  virtual_text = {
    prefix = '●', -- Prefix for virtual text
    format = function(diagnostic)
      -- Hvis diagnosen er en advarsel (severity = WARN), forkort meldingen
      if diagnostic.severity == vim.diagnostic.severity.WARN then
        local shortened_message = string.sub(diagnostic.message, 1, 50) -- Klipp meldingen til 50 tegn
        return string.format('%s', shortened_message) -- Vis den forkortede meldingen
      end
      -- Hvis det ikke er en advarsel, vis hele meldingen
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
