return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  
 -- {
    -- "sphamba/smear-cursor.nvim",
    -- lazy = false,
    -- opts = {
    --   time_interval = 5, -- milliseconds
      --cterm_cursor_colors = { 240, 245, 250, 255 },
      --cterm_bg = 235,
      --

      -- Snow particles:
      -- cursor_color = "#ffffff",
      -- gradient_exponent = 0,
      -- particles_enabled = true,
      -- particle_spread = 1,
      -- particles_per_second = 100,
      -- particles_per_length = 50,
      -- particle_max_lifetime = 1500,
      -- particle_max_initial_velocity = 10,
      -- particle_velocity_from_cursor = 0,
      -- particle_random_velocity = 300,
      -- particle_damping = 0.1,
      -- particle_gravity = 50,

      -- Fire particles:
       -- cursor_color = "#ff4000",
       -- particles_enabled = true,
       -- stiffness = 0.5,
       -- trailing_stiffness = 0.2,
       -- trailing_exponent = 5,
       -- damping = 0.6,
       -- gradient_exponent = 0,
       -- gamma = 1,
       -- never_draw_over_target = true, -- if you want to actually see under the cursor
       -- hide_target_hack = true,       -- same
       -- particle_spread = 1,
       -- particles_per_second = 500,
       -- particles_per_length = 50,
       -- particle_max_lifetime = 800,
       -- particle_max_initial_velocity = 20,
       -- particle_velocity_from_cursor = 0.5,
       -- particle_damping = 0.15,
       -- particle_gravity = -50,
       -- min_distance_emit_particles = 0,
    -- },
  -- },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "rust", "toml",
      },
    },
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.opt.conceallevel = 0
    end,
  },
}
