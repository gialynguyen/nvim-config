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
    open_fn = require("packer.util").float, -- An optional function to open a window for packer's display
    working_sym = "🛠", -- The symbol for a plugin being installed/updated
    error_sym = "🧨", -- The symbol for a plugin with an error in installation/updating
    done_sym = "🎉", -- The symbol for a plugin which has completed installation/updating
    removed_sym = "🔥", -- The symbol for an unused plugin which was removed
    moved_sym = "🚀", -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = "━", -- The symbol for the header line in packer's display show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = "double", -- Border style of prompt popups.
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

  use "kyazdani42/nvim-web-devicons"

  use "glepnir/dashboard-nvim"

  use "sainnhe/gruvbox-material"

  use "nvim-treesitter/nvim-treesitter"

  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      local hop = require('hop')
      hop.setup {}

      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
    end
  }

  use "andymass/vim-matchup"

  use "machakann/vim-sandwich"

  use "mg979/vim-visual-multi"

  use {
    "numToStr/Comment.nvim",
  }

  use "JoosepAlviste/nvim-ts-context-commentstring"

  use {
    "ckipp01/stylua-nvim",
    run = "cargo install stylua",
  }

  use "nvim-telescope/telescope.nvim"
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use "nvim-telescope/telescope-live-grep-args.nvim"
  -- use "nvim-telescope/telescope-file-browser.nvim"

  use "Shatur/neovim-session-manager"

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.g.indentLine_char_list = { "|", "¦", "┆", "┊" }

      require("indent_blankline").setup {
        buftype_exclude = { "terminal", "nofile" },
        filetype_exclude = {
          "help",
          "dashboard",
          "packer",
          "NvimTree",
          "text",
        },
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        use_treesitter = true,
        show_current_context = true,
      }
    end,
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      local status_ok, autopairs = pcall(require, "nvim-autopairs")
      if not status_ok then
        return
      end
      local Rule = require "nvim-autopairs.rule"
      autopairs.setup {
        active = true,
        on_config_done = nil,
        ---@usage  modifies the function or method delimiter by filetypes
        map_char = {
          all = "(",
          tex = "{",
        },
        ---@usage check bracket in same line
        enable_check_bracket_line = false,
        ---@usage check treesitter
        check_ts = true,
        ts_config = {
          lua = { "string", "source" },
          javascript = { "string", "template_string" },
          java = false,
        },
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
        enable_moveright = true,
        ---@usage disable when recording or executing a macro
        disable_in_macro = false,
        ---@usage add bracket pairs after quote
        enable_afterquote = true,
        ---@usage map the <BS> key
        map_bs = true,
        ---@usage map <c-w> to delete a pair if possible
        map_c_w = false,
        ---@usage disable when insert after visual block mode
        disable_in_visualblock = false,
        ---@usage  change default fast_wrap
        fast_wrap = {
          map = "<M-e>",
          chars = { "{", "[", "(", "\"", "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
          offset = 0, -- Offset from pattern match
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
          highlight = "Search",
          highlight_grey = "Comment",
        },
      }
      local ts_conds = require "nvim-autopairs.ts-conds"

      -- TODO: can these rules be safely added from "config.lua" ?
      -- press % => %% is only inside comment or string
      autopairs.add_rules {
        Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
        Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
      }

      pcall(function()
        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end)
    end,
  }

  use "windwp/nvim-ts-autotag"

  use {
    "nvim-lualine/lualine.nvim",
    config = function()
      require "plugins-opts.lualine"
    end,
  }

  use "williamboman/nvim-lsp-installer"

  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require "lspsaga"
      saga.init_lsp_saga {
        code_action_lightbulb = {
          enable = false,
          enable_in_insert = false,
        },
      }
    end,
  }

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp-signature-help"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/vim-vsnip"
  use "f3fora/cmp-spell"
  use "hrsh7th/cmp-path"
  use "rafamadriz/friendly-snippets"

  use {
    "kyazdani42/nvim-tree.lua",
    -- tag = "nightly", -- optional, updated every week. (see issue #1193)
  }

  use {
    "neovim/nvim-lspconfig",
  }

  use "onsails/lspkind-nvim"

  use "lewis6991/gitsigns.nvim"

  use "jose-elias-alvarez/null-ls.nvim"

  use "voldikss/vim-floaterm"

  use {
    'akinsho/bufferline.nvim',
    tag = "v3.*",
  }

  use {
    "xiyaowong/nvim-transparent",
  }

  use {
    "akinsho/toggleterm.nvim",
    tag = "*",
    config = function()
      require("toggleterm").setup {
        size = 20,
        float_opts = {
          winblend = 0,
        },
        highlights = {
          Normal = {
            link = "Normal",
          },
        },
      }
    end,
  }

  use {
    "ray-x/guihua.lua",
  }

  use {
    "ray-x/sad.nvim",
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
    "SmiteshP/nvim-navic",
    run = function()
      require("nvim-navic").setup {
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      }
    end,
  }

  use {
    "johann2357/nvim-smartbufs",
  }

  use {
    "kwkarlwang/bufjump.nvim",
    config = function()
      require("bufjump").setup {
        forward = "<leader>p",
        backward = "<leader>o",
        on_success = function()
          vim.cmd [[execute "normal! g`\"zz"]]
        end,
      }
    end,
  }

  use {
    "RRethy/vim-illuminate",
    config = function()
      local illuminate = require "illuminate"
      illuminate.configure {
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 1000,
        filetypes_denylist = {
          "dashboard",
          "NvimTree",
          "packer",
          "Outline",
          "terminal",
          "floaterm",
          "toggleterm",
          "TelescopePrompt",
        },
        -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
        filetypes_allowlist = {},
        -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
        modes_denylist = {},
        -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
        modes_allowlist = {},
        -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_denylist = {},
        -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
        -- Only applies to the 'regex' provider
        -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
        providers_regex_syntax_allowlist = {},
        -- under_cursor: whether or not to illuminate under the cursor
        under_cursor = true,
      }
    end,
  }

  use {
    "mxsdev/symbols-outline.nvim",
    branch = "merge-jsx-tree",
    config = function()
      require("symbols-outline").setup {
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = "right",
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = "Pmenu",
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { "", "" },
        wrap = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { "<Esc>", "q" },
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
          fold = "h",
          unfold = "l",
          fold_all = "W",
          unfold_all = "E",
          fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
        symbols = {
          File = { icon = "", hl = "TSURI" },
          Module = { icon = "", hl = "TSNamespace" },
          Namespace = { icon = "", hl = "TSNamespace" },
          Package = { icon = "", hl = "TSNamespace" },
          Class = { icon = "𝓒", hl = "TSType" },
          Method = { icon = "ƒ", hl = "TSMethod" },
          Property = { icon = "", hl = "TSMethod" },
          Field = { icon = "", hl = "TSField" },
          Constructor = { icon = "", hl = "TSConstructor" },
          Enum = { icon = "ℰ", hl = "TSType" },
          Interface = { icon = "ﰮ", hl = "TSType" },
          Function = { icon = "", hl = "TSFunction" },
          Variable = { icon = "", hl = "TSConstant" },
          Constant = { icon = "", hl = "TSConstant" },
          String = { icon = "𝓐", hl = "TSString" },
          Number = { icon = "#", hl = "TSNumber" },
          Boolean = { icon = "⊨", hl = "TSBoolean" },
          Array = { icon = "", hl = "TSConstant" },
          Object = { icon = "⦿", hl = "TSType" },
          Key = { icon = "🔐", hl = "TSType" },
          Null = { icon = "NULL", hl = "TSType" },
          EnumMember = { icon = "", hl = "TSField" },
          Struct = { icon = "𝓢", hl = "TSType" },
          Event = { icon = "🗲", hl = "TSType" },
          Operator = { icon = "+", hl = "TSOperator" },
          TypeParameter = { icon = "𝙏", hl = "TSParameter" },
        },
      }
    end,
  }

  use {
    "karb94/neoscroll.nvim",
    config = function()
      require('neoscroll').setup {}
    end
  }

  use {
    "yioneko/nvim-yati",
    tag = "*",
  }

  use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)

require("telescope").setup {
  defaults = {
    mappings = { n = { ["o"] = require("telescope.actions").select_default } },
    initial_mode = "normal",
    hidden = false,
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    treesitter = {
      theme = "ivy",
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    live_grep_raw = {
      vimgrep_argument = {
        "rg",
      },
    },
  },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"
require("telescope").load_extension "live_grep_args"

require("nvim-treesitter.configs").setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },
  },
  autopairs = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "bash",
    "cpp",
    "css",
    "go",
    "html",
    "lua",
    "make",
    "python",
    "rust",
    "tsx",
    "javascript",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  yati = {
    enable = true,
    suppress_conflict_warning = true,
    default_lazy = true,
    default_fallback = "auto"
  },
  indent = {
    enable = true,
    disable = { "html", "javascript", "typescript", "typescriptreact", "javascriptreact" }
  },
}

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  vim.lsp.buf_request(
    bufnr,
    "textDocument/formatting",
    vim.lsp.util.make_formatting_params {},
    function(err, res, ctx)
      if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
        return
      end

      if res then
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
        vim.api.nvim_buf_call(bufnr, function()
          vim.cmd "silent noautocmd update"
        end)
      end
    end
  )
end

local is_disable_null_ls = 0

local disable_null_ls = function()
  is_disable_null_ls = 1
end

local enable_null_ls = function()
  is_disable_null_ls = 0
end

vim.api.nvim_create_user_command("NullLsDisable", disable_null_ls, {})
vim.api.nvim_create_user_command("NullLsEnable", enable_null_ls, {})

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if is_disable_null_ls == 0 then
            async_formatting(bufnr)
          end
        end,
      })
    end
  end,
}

local lspkind = require "lspkind"

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require "cmp"
local types = require "cmp.types"

local function deprioritize_snippet(entry1, entry2)
  if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return false
  end
  if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
    return true
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      deprioritize_snippet,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.scopes,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    format = lspkind.cmp_format {
      mode = "symbol_text", -- show only symbol annotations
      preset = 'codicons',
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
      },

      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      before = function(entry, vim_item)
        return vim_item
      end,
    },
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-s>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif cmp.visible and vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif cmp.visible and vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ["<C-c>"] = cmp.mapping.abort(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect",
    autocomplete = {
      cmp.TriggerEvent.TextChanged,
    },
  },
  view = {
    entries = "custom",
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
  sources = {
    { name = "vsnip", max_item_count = 4 },
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    {
      name = "spell",
      option = {
        keep_all_entries = false,
        enable_in_context = function()
          return true
        end,
      },
    },
    { name = "buffer", max_item_count = 4 },
    { name = "path", max_item_count = 4 },
  },
}

require("gitsigns").setup {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
  signcolumn = false,
  numhl = true,
}

local db = require "dashboard"
db.custom_header = {
  "",
  "",
  "",
  "",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "",
  "",
  "",
}
db.custom_center = {
  {
    icon = " ",
    desc = "Recently latest session      ",
    action = "SessionManager load_session",
  },
  {
    icon = " ",
    desc = "Recently opened files    ",
    action = "Telescope oldfiles",
    shortcut = ", re",
  },
  {
    icon = " ",
    desc = "New File                  ",
    action = "DashboardNewFile",
    shortcut = ", o",
  },
  {
    icon = " ",
    desc = "Browse Files              ",
    action = "Telescope file_browser",
    shortcut = ", n",
  },
  {
    icon = " ",
    desc = "Find File                 ",
    action = "Telescope find_files",
    shortcut = ", f",
  },
  {
    icon = " ",
    desc = "Configure Neovim          ",
    action = "edit ~/.config/nvim/init.vim",
    shortcut = ", v",
  },
  {
    icon = " ",
    desc = "Exit Neovim                  ",
    action = "quit",
  },
}
vim.keymap.set("n", "<Leader>o", ":DashboardNewFile<CR>", { silent = true })

local Path = require "plenary.path"
require("session_manager").setup {
  sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- The directory where the session files will be saved.
  path_replacer = "__", -- The character to which the path separator will be replaced for session files.
  colon_replacer = "++", -- The character to which the colon symbol will be replaced for session files.
  autoload_mode = require("session_manager.config").AutoloadMode.Disabled, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = true, -- Automatically save last session on exit and on session switch.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
  autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
    "gitcommit",
  },
  autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
  max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
}

require("nvim-tree").setup {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  filters = {
    dotfiles = false,
  },
  git = {
    enable = true,
    ignore = false,
    show_on_dirs = true,
    timeout = 400,
  },
}

local comment = require "Comment"

comment.setup {
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
      local U = require "Comment.utils"

      -- Determine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring {
        key = type,
        location = location,
      }
    end
  end,
}

require("sad").setup {
  diff = "delta", -- you can use `diff`, `diff-so-fancy`
  ls_file = "fd", -- also git ls_file
  exact = false, -- exact match
  vsplit = true, -- split sad window the screen vertically, when set to number
  -- it is a threadhold when window is larger than the threshold sad will split vertically,
  height_ratio = 0.6, -- height ratio of sad window when split horizontally
  width_ratio = 0.6, -- height ratio of sad window when split vertically
}

require("nvim-web-devicons").setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh",
    },
  },
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
}

local bufferline = require('bufferline')

local close_func = function(bufnum)
  local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
  if bufdelete_avail then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd["bdelete!"] { args = { bufnum } }
  end
end

bufferline.setup {
  options = {
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 },
      { filetype = "neo-tree", text = "", padding = 1 },
      { filetype = "Outline", text = "", padding = 1 },
    },
    numbers = "ordinal",
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    close_command = close_func,
    right_mouse_command = close_func,
    -- max_name_length = 14,
    -- max_prefix_length = 13,
    -- tab_size = 20,
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(_, _, diagnostics, _)
      local result = {}
      local symbols = {
        error = "",
        warning = "",
      }

      for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
          table.insert(result, symbols[name] .. " " .. count)
        end
      end

      local result_string = table.concat(result, " ")
      return #result > 0 and result_string or ""
    end
  },
  highlights = {
    background = {
      fg = "NONE",
      bg = "NONE"
    },
    buffer = {
      fg = "NONE",
      bg = "NONE"
    },
    buffer_visible = {
      fg = "NONE",
      bg = "NONE"
    },
    buffer_selected = {
      fg = "NONE",
      bg = "NONE"
    }
  }
}

require("transparent").setup {
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineFill",
    "BufferLineBackground",

    "BufferLineTab",
    "BufferLineTabSelected",
    "BufferLineTabClose",
    "BufferLineTabSeparator",
    "BufferLineTabSelected",

    "BufferLineNumbers",


    "BufferLineDuplicate",

    "BufferLineDiagnostic",
    "BufferLineDiagnosticVisble",
    "BufferLineDiagnosticSelected",

    "BufferLineError",
    "BufferLineErrorVisible",
    "BufferLineErrorSelected",
    "BufferLineErrorDiagnostic",
    "BufferLineErrorDiagnosticSelected",
    "BufferLineErrorDiagnosticVisible",

    "BufferLineWarning",
    "BufferLineWarningVisible",
    "BufferLineWarningSelected",
    "BufferLineWarningDiagnostic",
    "BufferLineWarningDiagnosticSelected",
    "BufferLineWarningDiagnosticVisible",

    "BufferLineInfo",
    "BufferLineInfoVisible",
    "BufferLineInfoSelected",

    "BufferLineInfoDiagnostic",
    "BufferLineInfoDiagnosticSelected",
    "BufferLineInfoDiagnosticVisible",

    "BufferLineHint",
    "BufferLineHintVisible",
    "BufferLineHintSelected",
    "BufferLineHintDiagnostic",
    "BufferLineHintDiagnosticSelected",
    "BufferLineHintDiagnosticVisible",

    "BufferLineCloseButton",
    "BufferLineCloseButtonVisible",
    "BufferLineCloseButtonSelected",

    "BufferLineBuffer",
    "BufferLineBufferSelected",
    "BufferLineBufferVisible",

    "BufferLineNumbers",
    "BufferLineNumbersVisible",
    "BufferLineNumbersSelected",

    "BufferLineModified",
    "BufferLineModifiedSelected",
    "BufferLineModifiedVisible",

    "BufferLineIndicator",
    "BufferLineIndicatorSelected",

    "BufferLineSeparator",
    "BufferLineSeparatorSelected",
    "BufferLineSeparatorVisible",
    "BufferLineOffsetSeparator",
    "BufferLineGroupSeparator",

    "BufferLineDuplicate",
    "BufferLineDuplicateVisible",
    "BufferLineDuplicateSelected",

    "toggleterm",
  },
  exclude = {}, -- table: groups you don't want to clear
}
