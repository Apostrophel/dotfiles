return {
  "nvim-telescope/telescope-media-files.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim", 
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require('telescope').setup {
      extensions = {
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "pdf"},
          -- find command (defaults to `fd`)
          find_cmd = "rg" -- or "fd"
        }
      },
    }
    require('telescope').load_extension('media_files')
  end,
}
