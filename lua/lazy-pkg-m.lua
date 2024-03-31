local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
  defaults = { lazy = true },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {},
    },
  },
  checker = {
    enabled = true,
    frequency = 86400,
  },
}

require("lazy").setup({
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },

  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require "plugins-opts.devicons"
    end,
    event = "VeryLazy",
  },
  -- Colors
  {
    "nvimdev/dashboard-nvim",
    config = function()
      require "plugins-opts.dashboard"
    end,
    event = "VimEnter",
  },

  {
    "sainnhe/gruvbox-material",
    lazy = true,
  },

  { "nyoom-engineering/oxocarbon.nvim", lazy = true },

  { "sainnhe/everforest",               lazy = true },

  {
    'navarasu/onedark.nvim',
    lazy = true,
    priority = 1000
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins-opts.treesitter"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      {
        "yioneko/nvim-yati",
      },
      {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
      },
    },
    event = "VeryLazy",
    build = ":TSUpdate",
  },

  {
    "phaazon/hop.nvim",
    config = function()
      require "plugins-opts.hop"
    end,
    event = "VeryLazy",
  },

  -- {
  --   "andymass/vim-matchup",
  --   setup = function()
  --     require "plugins-opts.matchup"
  --   end,
  --   event = "VeryLazy",
  --   disable = false,
  -- },

  {
    "machakann/vim-sandwich",
    event = "BufRead",
  },

  {
    "mg979/vim-visual-multi",
    event = "BufRead",
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require "plugins-opts.comment"
    end,
    event = "VeryLazy",
  },

  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugins-opts.telescope"
    end,
    dependencies = {
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    event = "VeryLazy",
  },

  -- {
  --   "renerocksai/telekasten.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim" },
  --   cmd = "Telekasten",
  -- },

  {
    "Shatur/neovim-session-manager",
    config = function()
      require "plugins-opts.session_manager"
    end,
    lazy = false,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins-opts.indent-blankline"
    end,
    event = "VeryLazy",
    main = "ibl",
  },

  {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins-opts.autopairs"
    end,
    event = "InsertEnter",
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins-opts.lualine"
    end,
    event = "VeryLazy",
  },

  {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins-opts.cmp"
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "lukas-reineke/cmp-under-comparator",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    event = "InsertEnter",
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    enabled = false,
    config = function()
      require("codeium").setup {}
    end,
  },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require "plugins-opts.snippets"
    end,
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
  },

  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
  },

  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require "plugins-opts.nvim-tree"
    end,
    event = "VeryLazy",
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      "onsails/lspkind-nvim",
      "jose-elias-alvarez/typescript.nvim",
    },
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require "plugins-opts.mason"
    end,
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", event = "VeryLazy" },
    },
    event = "VeryLazy",
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require "plugins-opts.saga"
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins-opts.gitsign"
    end,
    cmd = "Gitsigns",
  },

  {
    "tpope/vim-fugitive",
    event = "User InGitRepo",
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "plugins-opts.null-ls"
    end,
    event = "VeryLazy",
  },

  {
    "voldikss/vim-floaterm",
    init = function()
      require "plugins-opts.floaterm"
    end,
    -- lazy = false,
    event = "VeryLazy",
  },

  {
    "akinsho/bufferline.nvim",
    config = function()
      require "plugins-opts.bufferline"
    end,
    dependencies = {
      "famiu/bufdelete.nvim"
    },
    event = { "BufEnter" },
  },

  {
    "xiyaowong/nvim-transparent",
    config = function()
      require "plugins-opts.transparent"
    end,
    lazy = true,
  },

  {
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugins-opts.togglerterm"
    end,
    event = "VeryLazy",
  },

  {
    "folke/zen-mode.nvim",
    config = function()
      require "plugins-opts.zen-mode"
    end,
    cmd = "ZenMode",
  },

  {
    "ray-x/sad.nvim",
    config = function()
      require "plugins-opts.sad"
    end,
    enabled = false,
    dependencies = {
      "ray-x/guihua.lua",
    },
    event = "VeryLazy",
  },

  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    setup = function()
      vim.g.mkdp_theme = "dark"
    end,
    event = "VeryLazy",
  },

  {
    "johann2357/nvim-smartbufs",
    event = "BufEnter",
  },

  {
    "ton/vim-bufsurf",
    event = "BufEnter",
  },

  {
    "RRethy/vim-illuminate",
    config = function()
      require "plugins-opts.illuminate"
    end,
    event = "BufEnter",
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require "plugins-opts.neoscroll"
    end,
    event = "VeryLazy",
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require "plugins-opts.lsp_lines"
    end,
    event = "VeryLazy",
  },
  {
    "kevinhwang91/nvim-ufo",
    config = function()
      require "plugins-opts.ufo"
    end,
    dependencies = {
      "neovim/nvim-lspconfig",
      "kevinhwang91/promise-async",
    },
    event = "BufEnter",
  },

  {
    "JellyApple102/flote.nvim",
    config = function()
      require "plugins-opts.flote"
    end,
    lazy = false,
  },

  {
    "famiu/bufdelete.nvim",
  },
}, lazy_opts)
