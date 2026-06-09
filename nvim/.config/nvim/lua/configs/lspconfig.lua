require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "bashls", "marksman", "texlab" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

-- Rust / Nannou LSP config
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        buildScripts = { enable = true },
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = true,
      check = {
        command = "clippy",
      },
      diagnostics = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable("rust_analyzer")
