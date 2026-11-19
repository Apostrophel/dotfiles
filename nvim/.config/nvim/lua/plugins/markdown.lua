-- Markdown / Obsidian vault editing
return {
  -- In-buffer "live preview": renders headings, callouts, tables, checkboxes,
  -- code blocks and (simple) LaTeX; the cursor line shows raw markdown.
  -- Toggle with :RenderMarkdown toggle
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      -- inline math as unicode; needs `pylatexenc` (latex2text) on PATH
      latex = { enabled = true },
      completions = { lsp = { enabled = true } },
    },
  },

  -- Vault features: [[wikilinks]], backlinks, daily notes, templates, search.
  -- Replaces marksman for markdown LSP features.
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      legacy_commands = false,
      workspaces = {
        { name = "phd", path = "~/Documents/notes/phd-vault" },
      },
      ui = { enable = false }, -- render-markdown handles rendering
    },
  },
}
