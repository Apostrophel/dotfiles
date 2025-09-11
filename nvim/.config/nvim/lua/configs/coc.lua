-- CoC configuration
vim.g.coc_global_extensions = {
  'coc-json',
  'coc-tsserver',
  'coc-pyright',
  'coc-clangd',
  -- add whatever extensions you need

  -- Markdown support
  'coc-markdownlint',   -- Markdown linting
  'coc-markdown-preview-enhanced', -- Markdown preview

  -- LaTeX support
  'coc-texlab',         -- LaTeX LSP
  'coc-ltex',           -- Grammar/spell checking for LaTeX

  -- Additional useful extensions
  'coc-snippets',       -- Snippet support
  'coc-pairs',          -- Auto pairs
}
