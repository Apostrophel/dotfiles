vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.conceallevel = 1
vim.opt.rtp:prepend(lazypath)


local lazy_config = require "configs.lazy"

-- WSL clipboard configuration
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'xclip -selection clipboard',
            ['*'] = 'xclip -selection primary',
        },
        paste = {
            ['+'] = 'xclip -selection clipboard -o',
            ['*'] = 'xclip -selection primary -o',
        },
        cache_enabled = 0,
    }
end

-- Set clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy = false,
  --   dependencies = { "rcarriga/nvim-notify","MunifTanjim/nui.nvim" },
  --   opts = {
  --     notification = true,
  --   },
  -- },
  
  {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  config = function()
    require("diffview").setup({
      -- Optional: customize settings here
      diff_binaries = false,    -- Show diffs for binaries
      enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
      git_cmd = { "git" },      -- The git executable followed by default args
      use_icons = true,         -- Requires nvim-web-devicons
    })
  end,
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
  },

  {
  "szw/vim-maximizer",
  keys = {
      { "<leader>z", "<cmd>MaximizerToggle<cr>", desc = "Toggle zoom" },
    },
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.notify = require("notify")

vim.schedule(function()
  require "mappings"
end)
