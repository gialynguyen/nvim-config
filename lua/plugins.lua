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

	use "glepnir/dashboard-nvim"

	use { "nvim-telescope/telescope-ui-select.nvim" }

	use "sainnhe/gruvbox-material"

	use "nvim-treesitter/nvim-treesitter"

	use "ryanoasis/vim-devicons"

	use "justinmk/vim-sneak"

	use "andymass/vim-matchup"

	use "junegunn/vim-slash"

	use "mg979/vim-visual-multi"

	use {
		"ckipp01/stylua-nvim",
		run = "cargo install stylua",
	}

	use "machakann/vim-sandwich"

	use {
		"numToStr/Comment.nvim",
	}

	use "JoosepAlviste/nvim-ts-context-commentstring"

	use {
		"nvim-lua/plenary.nvim",
		opt = false,
	}
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-file-browser.nvim"
	use "nvim-telescope/telescope-live-grep-args.nvim"
	use "Shatur/neovim-session-manager"

	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end,
	}

	use {
		"windwp/nvim-ts-autotag",
	}

	use {
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}

	use "williamboman/nvim-lsp-installer"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/nvim-cmp"
	use "L3MON4D3/LuaSnip"
	use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }
	use {
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		-- tag = "nightly", -- optional, updated every week. (see issue #1193)
	}

	use "saadparwaiz1/cmp_luasnip"
	use {
		"neovim/nvim-lspconfig",
	}
	use "onsails/lspkind-nvim"
	use "rafamadriz/friendly-snippets"

	use "lewis6991/gitsigns.nvim"

	use "tpope/vim-fugitive"

	use "jose-elias-alvarez/null-ls.nvim"

	use "voldikss/vim-floaterm"

	use "lukas-reineke/indent-blankline.nvim"

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

vim.diagnostic.config {
	virtual_text = false,
	signs = true,
	float = {
		header = false,
		source = "always",
	},
}

vim.keymap.set("", "<Leader>x", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

require("telescope").setup {
	defaults = {
		mappings = { n = { ["o"] = require("telescope.actions").select_default } },
		initial_mode = "normal",
		hidden = false,
		file_ignore_patterns = { ".git/", "node_modules/", "target/" },
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
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			mappings = {},
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
			},
			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
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
require("telescope").load_extension "file_browser"
require("telescope").load_extension "ui-select"
require("telescope").load_extension "live_grep_args"

require("nvim-treesitter.configs").setup {
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
	highlight = { enable = true },
}

require("lualine").setup {
	options = {
		icons_enabled = true,
		theme = "gruvbox-material",
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
		lualine_b = { "filename", "branch", { "diff", colored = false } },
		lualine_c = {},
		lualine_x = {
			{
				"diagnostics",

				-- Table of diagnostic sources, available sources are:
				--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
				-- or a function that returns a table as such:
				--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					color_error = { fg = "#ec5f67" },
					color_warn = { fg = "#ECBE7B" },
					color_info = { fg = "#008080" },
				},
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = true, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
		},
		lualine_y = { "filetype", "progress" },
		lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				separator = { left = "", right = "" },
				right_padding = 2,
				symbols = { alternate_file = "" },
			},
		},
	},
}

local async_formatting = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		vim.lsp.util.make_formatting_params {},
		function(err, res, ctx)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				-- you can modify the log message / level (or ignore it completely)
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end

			-- don't apply results if buffer is unloaded or has been modified
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

vim.api.nvim_create_user_command("NullLsDisable", disable_null_ls, {})

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local should_enable_eslint = function(utils)
	return utils.root_has_file { "node_modules/.bin/eslint" }
end

null_ls.setup {
	sources = {
		null_ls.builtins.diagnostics.eslint.with {
			condition = should_enable_eslint,
		},
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint.with {
			condition = should_enable_eslint,
		},
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.completion.spell,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.eslint.with {
			condition = should_enable_eslint,
		},
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
local luasnip = require "luasnip"
-- local tabnine = require "cmp_tabnine.config"
--
-- tabnine.setup {
-- 	max_lines = 1000,
-- 	max_num_results = 20,
-- 	sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = "..",
-- 	ignored_file_types = {
-- 		-- default is not to ignore
-- 		-- uncomment to ignore in lua:
-- 		-- lua = true
-- 	},
-- 	show_prediction_strength = false,
-- }
--
require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local cmp = require "cmp"
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format {
			mode = "symbol_text", -- show only symbol annotations
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
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-c>"] = cmp.mapping.abort(),
		["<C-e>"] = cmp.mapping.close(),
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lsp" },
		{ name = "cmp_tabnine" },
		{ name = "buffer" },
		{ name = "path" },
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

require("indent_blankline").setup {
	-- for example, context is off by default, use this to turn it on
	show_current_context = true,
	show_current_context_start = true,
}

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
}

require("nvim-ts-autotag").setup()

require("nvim-treesitter.configs").setup {
	context_commentstring = {
		enable = true,
	},
}

local comment = require "Comment"

comment.setup {
	pre_hook = function(ctx)
		-- Only calculate commentstring for tsx filetypes
		if vim.bo.filetype == "typescriptreact" then
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
