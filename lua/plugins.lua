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

	use "kyazdani42/nvim-web-devicons"

	use "glepnir/dashboard-nvim"

	use { "nvim-telescope/telescope-ui-select.nvim" }

	use "sainnhe/gruvbox-material"

	use "folke/tokyonight.nvim"

	use "nvim-treesitter/nvim-treesitter"

	use "justinmk/vim-sneak"

	use "andymass/vim-matchup"

	use "haya14busa/is.vim"

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

	use {
		"nvim-lua/plenary.nvim",
		opt = false,
	}

	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use "nvim-telescope/telescope.nvim"
	use "nvim-telescope/telescope-live-grep-args.nvim"
	-- use "nvim-telescope/telescope-file-browser.nvim"

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

	use "feline-nvim/feline.nvim"

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
		"akinsho/toggleterm.nvim",
		tag = "v2.*",
		config = function()
			require("toggleterm").setup()
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

	use "xiyaowong/nvim-transparent"

	use {
		"maxmellon/vim-jsx-pretty",
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
		"noib3/nvim-cokeline",
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
		-- file_browser = {
		-- 	theme = "ivy",
		-- 	hijack_netrw = false,
		-- 	mappings = {},
		-- 	-- file_ignore_patterns = { ".git/", "node_modules/", "target/" },
		-- },
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
-- require("telescope").load_extension "file_browser"
require("telescope").load_extension "ui-select"
require("telescope").load_extension "live_grep_args"

require("nvim-treesitter.configs").setup {
	context_commentstring = {
		enable = true,
	},
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
	indent = {
		enable = true,
	},
}

local async_formatting = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		vim.lsp.util.make_formatting_params {},
		function(err, res, ctx)
			-- if err then
			-- 	local err_msg = type(err) == "string" and err or err.message
			-- 	-- you can modify the log message / level (or ignore it completely)
			-- 	vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
			-- 	return
			-- end

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

local enable_null_ls = function()
	is_disable_null_ls = 0
end

vim.api.nvim_create_user_command("NullLsDisable", disable_null_ls, {})
vim.api.nvim_create_user_command("NullLsEnable", enable_null_ls, {})

local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

local is_forced_enable_eslint = 0

local force_enable_eslint = function()
	is_forced_enable_eslint = 1
end

local force_disable_eslint = function()
	is_forced_enable_eslint = 0
end

local should_enable_eslint = function(utils)
	return utils.root_has_file { "node_modules/.bin/eslint" } or is_forced_enable_eslint == 1
end

vim.api.nvim_create_user_command("NullLsForceEnableEslint", force_enable_eslint, {})
vim.api.nvim_create_user_command("NullLsForceDisableEslint", force_disable_eslint, {})

null_ls.setup {
	sources = {
		null_ls.builtins.diagnostics.eslint.with {
			condition = should_enable_eslint,
		},
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.eslint.with {
			condition = should_enable_eslint,
			args = {
				"--fix-dry-run",
				"--format",
				"json",
				"--stdin",
				"--stdin-filename",
				"$FILENAME",
			},
		},
		null_ls.builtins.formatting.gofmt,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.rustfmt,
		null_ls.builtins.formatting.stylua,
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

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require "cmp"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
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
			-- the rest of the comparators are pretty much the defaults
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
			elseif vim.fn["vsnip#available"](1) == 1 then
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
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
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
		autocomplete = false,
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
		{ name = "buffer", keyword_length = 2, max_item_count = 4 },
		{ name = "path", keyword_length = 3, max_item_count = 4 },
	},
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

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

-- require("indent_blankline").setup {
-- 	-- for example, context is off by default, use this to turn it on
-- 	show_current_context = true,
-- 	show_current_context_start = true,
-- }

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

require("nvim-ts-autotag").setup()

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

require("transparent").setup {
	enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups

		-- example of akinsho/nvim-bufferline.lua
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
	exclude = {}, -- table: groups you don't want to clear
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

local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end

local feline_theme = {
	bg = "#282828",
	bgdark = "#5a524c",
	black = "#282828",
	yellow = "#d8a657",
	cyan = "#89b482",
	oceanblue = "#45707a",
	green = "#a9b665",
	orange = "#e78a4e",
	violet = "#d3869b",
	magenta = "#c14a4a",
	white = "#a89984",
	fg = "#a89984",
	skyblue = "#7daea3",
	red = "#ea6962",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
			},
		},
		hl = function()
			return {
				fg = require("feline.providers.vi_mode").get_mode_color(),
				bg = "bg",
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	name = {
		provider = function()
			return "Steven"
		end,
		hl = {
			fg = "#3c3836",
			bg = "#ebdbb2",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "peanut",
			bg = "bgdark",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "bgdark",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "bgdark",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "bgdark",
		},
		left_sep = "block",
		right_sep = "block",
	},
	separator = {
		provider = function()
			return ""
		end,
		hl = {
			fg = "bgdark",
		},
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "unique",
			},
		},
		hl = {
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	separator_right = {
		provider = function()
			return ""
		end,
		hl = {
			fg = "bgdark",
		},
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "red",
			bg = "bgdark",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "bgdark",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "green",
			bg = "bgdark",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "aqua",
			bg = "bgdark",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
}

local left = {
	c.vim_mode,
	c.name,
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.separator,
}

local middle = {
	c.fileinfo,
}

local right = {
	c.separator_right,
	c.file_type,
	c.file_encoding,
	c.position,
	c.line_percentage,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup {
	components = components,
	theme = feline_theme,
	vi_mode_colors = vi_mode_colors,
	disable = {
		filetypes = {
			"^NvimTree$",
		},
	},
}

local get_hex = require("cokeline/utils").get_hex
local errors_fg = get_hex("DiagnosticError", "fg")
local warnings_fg = get_hex("DiagnosticWarn", "fg")

require("cokeline").setup {
	default_hl = {
		fg = function(buffer)
			return buffer.is_focused and get_hex("Normal", "fg") or get_hex("Comment", "fg")
		end,
		bg = "NONE",
	},
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = function()
					return "  File Explorer  "
				end,
			},
		},
	},

	components = {
		{
			text = function(buffer)
				return (buffer.index == 1) and "   " or ""
			end,
			fg = function()
				return vim.g.terminal_color_2
			end,
		},
		{
			text = function(buffer)
				return " " .. buffer.index
			end,
		},
		{
			text = function(buffer)
				return "  " .. buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.unique_prefix .. buffer.filename
			end,
			fg = function(buffer)
				if buffer.is_focused then
					return vim.g.terminal_color_4
				end
				if buffer.is_modified then
					return vim.g.terminal_color_3
				end
				if buffer.lsp ~= nil and buffer.lsp.errors ~= 0 then
					return vim.g.terminal_color_9
				end
			end,
			style = function(buffer)
				return buffer.is_focused and "bold,underline" or nil
			end,
		},
		{
			text = function(buffer)
				return (buffer.diagnostics.errors ~= 0 and "   " .. buffer.diagnostics.errors)
					or (buffer.diagnostics.warnings ~= 0 and "   " .. buffer.diagnostics.warnings)
					or ""
			end,
			fg = function(buffer)
				return (buffer.diagnostics.errors ~= 0 and errors_fg)
					or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
					or nil
			end,
			truncation = { priority = 1 },
		},
		{
			text = function(buffer)
				return buffer.is_modified and "  ●  " or "    "
			end,
			fg = function(buffer)
				return buffer.is_modified and vim.g.terminal_color_2 or nil
			end,
			delete_buffer_on_left_click = true,
			truncation = { priority = 1 },
		},
		{
			text = "|",
			fg = function()
				return vim.g.terminal_color_3
			end,
		},
	},
}
