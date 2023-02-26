local packer = require "packer"
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  ---@diagnostic disable-next-line: lowercase-global
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

vim.cmd [[packadd packer.nvim]]

packer.init {
  display = {
    opt_default = true,
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end, -- An optional function to open a window for packer's display
    working_sym = "🛠", -- The symbol for a plugin being installed/updated
    error_sym = "🧨", -- The symbol for a plugin with an error in installation/updating
    done_sym = "🎉", -- The symbol for a plugin which has completed installation/updating
    removed_sym = "🔥", -- The symbol for an unused plugin which was removed
    moved_sym = "🚀", -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = "━", -- The symbol for the header line in packer's display show_all_info = true, -- Should packer show all update details automatically?
  },
}

local use = packer.use
packer.reset()

packer.startup(function()
  use {
    "wbthomason/packer.nvim",
    opt = false,
  }

  use {
    "nvim-lua/plenary.nvim",
    opt = false,
  }

  use {
    "kyazdani42/nvim-web-devicons",
    config = function()
      require "plugins-opts.devicons"
    end,
  }

  use {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
    config = function()
      require "plugins-opts.dashboard"
    end,
  }

  use {
    "sainnhe/gruvbox-material",
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugins-opts.nvim-tree"
    end,
  }

  use "nvim-treesitter/nvim-treesitter-textobjects"

  use {
    "phaazon/hop.nvim",
    config = function()
      require "plugins-opts.hop"
    end,
  }

  use "andymass/vim-matchup"

  use "machakann/vim-sandwich"

  use "mg979/vim-visual-multi"

  use {
    "numToStr/Comment.nvim",
    config = function()
      require "plugins-opts.comment"
    end,
  }

  use "JoosepAlviste/nvim-ts-context-commentstring"

  use {
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugins-opts.telescope"
    end,
  }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-live-grep-args.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"

  use {
    "Shatur/neovim-session-manager",
    config = function()
      require "plugins-opts.session_manager"
    end,
  }

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require "plugins-opts.indent-blankline"
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require "plugins-opts.autopairs"
    end,
  }

  use "windwp/nvim-ts-autotag"

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins-opts.lualine"
    end,
  }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require "plugins-opts.cmp"
    end,
  }
  use "hrsh7th/cmp-nvim-lsp"
  use "rafamadriz/friendly-snippets"

  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require "plugins-opts.snippets"
    end,
  }

  use "saadparwaiz1/cmp_luasnip"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "lukas-reineke/cmp-under-comparator"
  use {
    "jackieaskins/cmp-emmet",
    run = "npm run release",
  }

  use {
    "kyazdani42/nvim-tree.lua",
  }

  use {
    "neovim/nvim-lspconfig",
  }

  use { "williamboman/mason-lspconfig.nvim" }

  use {
    "williamboman/mason.nvim",
    config = function()
      require "plugins-opts.mason"
    end,
  }

  use "onsails/lspkind-nvim"

  use {
    "ray-x/lsp_signature.nvim",
  }

  use {
    "glepnir/lspsaga.nvim",
    commit = "fb5ec294f833ce5563fc5abce4eb9725d7809652",
    config = function()
      require "plugins-opts.saga"
    end,
  }

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require "plugins-opts.gitsign"
    end,
  }
  use {
    "sindrets/diffview.nvim",
  }

  use "tpope/vim-fugitive"

  use "jose-elias-alvarez/typescript.nvim"

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "plugins-opts.null-ls"
    end,
  }

  use {
    "voldikss/vim-floaterm",
    config = function()
      require "plugins-opts.floaterm"
    end,
  }

  use {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    config = function()
      require('plugins-opts.bufferline')
    end
  }

  use {
    "xiyaowong/nvim-transparent",
    config = function()
      require('plugins-opts.transparent')
    end
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require "plugins-opts.togglerterm"
    end,
  }

  use {
    "folke/zen-mode.nvim",
    config = function()
      require "plugins-opts.zen-mode"
    end,
  }

  use {
    "ray-x/guihua.lua",
  }

  use {
    "ray-x/sad.nvim",
    config = function()
      require "plugins-opts.sad"
    end,
  }

  use {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_theme = "light"
    end,
  }

  use {
    "johann2357/nvim-smartbufs",
  }

  use {
    "ton/vim-bufsurf",
  }

  use {
    "RRethy/vim-illuminate",
    config = function()
      require "plugins-opts.illuminate"
    end,
  }

  use {
    "mxsdev/symbols-outline.nvim",
    branch = "merge-jsx-tree",
    config = function()
      require "plugins-opts.outline"
    end,
  }

  use {
    "karb94/neoscroll.nvim",
    config = function()
      require "plugins-opts.neoscroll"
    end,
  }

  use {
    "yioneko/nvim-yati",
    tag = "*",
  }

  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require "plugins-opts.lsp_lines"
    end,
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
