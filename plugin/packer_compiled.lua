-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/gialynguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/gialynguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/gialynguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/gialynguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/gialynguyen/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n?\1\0\0\3\0\5\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\"luasnip.loaders.from_snipmate luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-emmet"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/cmp-emmet",
    url = "https://github.com/jackieaskins/cmp-emmet"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-under-comparator"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/cmp-under-comparator",
    url = "https://github.com/lukas-reineke/cmp-under-comparator"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/gruvbox-material",
    url = "https://github.com/sainnhe/gruvbox-material"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\1\22current_line_only\2\17AFTER_CURSOR\15hint_char1d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\1\22current_line_only\2\18BEFORE_CURSOR\15hint_char1u\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\2\22current_line_only\2\16hint_offset\3????\15\17AFTER_CURSOR\15hint_char1r\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\2\22current_line_only\2\16hint_offset\3\1\18BEFORE_CURSOR\15hint_char1?\2\1\0\b\0\21\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\0\0'\3\3\0B\1\2\0029\1\4\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\t\0003\6\n\0005\a\v\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\f\0003\6\r\0005\a\14\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\15\0003\6\16\0005\a\17\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\18\0003\6\19\0005\a\20\0B\2\5\0012\0\0?K\0\1\0\1\0\1\nremap\2\0\6T\1\0\1\nremap\2\0\6t\1\0\1\nremap\2\0\6F\1\0\1\nremap\2\0\6f\5\bset\vkeymap\bvim\18HintDirection\rhop.hint\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n?\2\0\0\4\0\f\0\0156\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\14dashboard\vpacker\rNvimTree\ttext\20buftype_exclude\1\0\4\19use_treesitter\2\25show_current_context\2\28show_first_indent_level\2#show_trailing_blankline_indent\1\1\3\0\0\rterminal\vnofile\nsetup\21indent_blankline\frequire\1\5\0\0\6|\a??\b???\b???\25indentLine_char_list\6g\bvim\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n\127\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\26code_action_lightbulb\1\0\0\1\0\2\venable\1\21enable_in_insert\1\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins-opts.lualine\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nlight\15mkdp_theme\6g\bvim\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/neoscroll.nvim",
    url = "https://github.com/karb94/neoscroll.nvim"
  },
  ["neovim-session-manager"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\ny\0\1\5\2\4\0\14-\1\0\0009\1\0\1B\1\1\2\18\3\1\0009\1\1\1B\1\2\2\6\1\2\0X\2\5?-\2\1\0009\2\3\2B\2\1\2\18\4\0\0B\2\2\1K\0\1\0\1?\0?\20on_confirm_done\18named_imports\ttype\23get_node_at_cursor?\1\1\0\a\0\b\0\0176\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2\18\4\2\0009\2\5\2'\5\6\0003\6\a\0B\2\4\0012\0\0?K\0\1\0\0\17confirm_done\aon\nevent\bcmp\29nvim-treesitter.ts_utils\"nvim-autopairs.completion.cmp\frequire?\a\1\0\r\0&\1L6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1?2\0D?6\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\5\0005\6\6\0=\6\a\0055\6\t\0005\a\b\0=\a\n\0065\a\v\0=\a\f\6=\6\r\0055\6\14\0=\6\15\0056\6\16\0009\6\17\6'\b\18\0'\t\19\0'\n\20\0B\6\4\2=\6\21\0055\6\22\0005\a\23\0=\a\24\0066\a\16\0009\a\17\a'\t\25\0'\n\19\0'\v\20\0B\a\4\2=\a\26\6=\6\27\5B\3\2\0016\3\1\0'\5\28\0B\3\2\0029\4\29\0014\6\3\0\18\a\2\0'\t\30\0'\n\30\0'\v\n\0B\a\4\2\18\t\a\0009\a\31\a9\n \0035\f!\0B\n\2\0A\a\1\2>\a\1\6\18\a\2\0'\t\"\0'\n\"\0'\v\n\0B\a\4\2\18\t\a\0009\a\31\a9\n#\0035\f$\0B\n\2\0A\a\1\0?\a\0\0B\4\2\0016\4\0\0003\6%\0B\4\2\1K\0\1\0K\0\1\0\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14fast_wrap\fpattern\25 [%'%\"%)%>%]%)%}%,] \nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\14highlight\vSearch\19highlight_grey\fComment\16check_comma\2\tkeys\31qwertyuiopzxcvbnmasdfghjkl\fend_key\6$\voffset\3\0\bmap\n<M-e>\22ignored_next_char\5\b%s+\21 [%w%%%'%[%\"%.] \tgsub\vstring\21disable_filetype\1\3\0\0\20TelescopePrompt\18spectre_panel\14ts_config\15javascript\1\3\0\0\vstring\20template_string\blua\1\0\1\tjava\1\1\3\0\0\vstring\vsource\rmap_char\1\0\2\btex\6{\ball\6(\1\0\t\vmap_bs\2\22enable_afterquote\2\21enable_moveright\2\vactive\2\21disable_in_macro\1\27disable_in_visualblock\1\rcheck_ts\2\30enable_check_bracket_line\1\fmap_c_w\1\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\npcall\5????\4\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-navic"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-smartbufs"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-smartbufs",
    url = "https://github.com/johann2357/nvim-smartbufs"
  },
  ["nvim-transparent"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-yati"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/nvim-yati",
    url = "https://github.com/yioneko/nvim-yati"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["sad.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/sad.nvim",
    url = "https://github.com/ray-x/sad.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n?\f\0\0\5\0B\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\0035\4+\0=\4,\0035\4-\0=\4.\0035\4/\0=\0040\0035\0041\0=\0042\0035\0043\0=\0044\0035\0045\0=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4>\0035\4?\0=\4@\3=\3A\2B\0\2\1K\0\1\0\fsymbols\18TypeParameter\1\0\2\ticon\t????\ahl\16TSParameter\rOperator\1\0\2\ticon\6+\ahl\15TSOperator\nEvent\1\0\2\ticon\t????\ahl\vTSType\vStruct\1\0\2\ticon\t????\ahl\vTSType\15EnumMember\1\0\2\ticon\b???\ahl\fTSField\tNull\1\0\2\ticon\tNULL\ahl\vTSType\bKey\1\0\2\ticon\t????\ahl\vTSType\vObject\1\0\2\ticon\b???\ahl\vTSType\nArray\1\0\2\ticon\b???\ahl\15TSConstant\fBoolean\1\0\2\ticon\b???\ahl\14TSBoolean\vNumber\1\0\2\ticon\6#\ahl\rTSNumber\vString\1\0\2\ticon\t????\ahl\rTSString\rConstant\1\0\2\ticon\b???\ahl\15TSConstant\rVariable\1\0\2\ticon\b???\ahl\15TSConstant\rFunction\1\0\2\ticon\b???\ahl\15TSFunction\14Interface\1\0\2\ticon\b???\ahl\vTSType\tEnum\1\0\2\ticon\b???\ahl\vTSType\16Constructor\1\0\2\ticon\b???\ahl\18TSConstructor\nField\1\0\2\ticon\b???\ahl\fTSField\rProperty\1\0\2\ticon\b???\ahl\rTSMethod\vMethod\1\0\2\ticon\a??\ahl\rTSMethod\nClass\1\0\2\ticon\t????\ahl\vTSType\fPackage\1\0\2\ticon\b???\ahl\16TSNamespace\14Namespace\1\0\2\ticon\b???\ahl\16TSNamespace\vModule\1\0\2\ticon\b???\ahl\16TSNamespace\tFile\1\0\0\1\0\2\ticon\b???\ahl\nTSURI\21symbol_blacklist\18lsp_blacklist\fkeymaps\nclose\1\0\v\19focus_location\6o\17hover_symbol\14<C-space>\18goto_location\t<Cr>\15fold_reset\6R\15unfold_all\6E\rfold_all\6W\vunfold\6l\tfold\6h\17code_actions\6a\18rename_symbol\6r\19toggle_preview\6K\1\3\0\0\n<Esc>\6q\17fold_markers\1\3\0\0\b???\b???\1\0\r\15auto_close\1\19relative_width\2\17auto_preview\1\16show_guides\2\27highlight_hovered_item\2\twrap\1\rposition\nright\nwidth\3\25\22auto_unfold_hover\2\25preview_bg_highlight\nPmenu\24show_symbol_details\2\26show_relative_numbers\1\17show_numbers\1\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/mxsdev/symbols-outline.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n?\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15highlights\vNormal\1\0\0\1\0\1\tlink\vNormal\15float_opts\1\0\1\rwinblend\3\0\1\0\1\tsize\3\20\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["typescript.nvim"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ["vim-bufsurf"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/vim-bufsurf",
    url = "https://github.com/ton/vim-bufsurf"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\nO\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\29????????????????????????\25floaterm_borderchars\6g\bvim\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n?\3\0\0\5\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\0034\4\0\0=\4\t\0034\4\0\0=\4\n\0034\4\0\0=\4\v\0034\4\0\0=\4\f\3B\1\2\1K\0\1\0%providers_regex_syntax_allowlist$providers_regex_syntax_denylist\20modes_allowlist\19modes_denylist\24filetypes_allowlist\23filetypes_denylist\1\t\0\0\14dashboard\rNvimTree\vpacker\fOutline\rterminal\rfloaterm\15toggleterm\20TelescopePrompt\14providers\1\0\2\ndelay\3?\a\17under_cursor\2\1\4\0\0\blsp\15treesitter\nregex\14configure\15illuminate\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/vim-sandwich",
    url = "https://github.com/machakann/vim-sandwich"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\2\nwidth\4????\3????\3\rbackdrop\3\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/Users/gialynguyen/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\1\22current_line_only\2\17AFTER_CURSOR\15hint_char1d\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\1\22current_line_only\2\18BEFORE_CURSOR\15hint_char1u\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\2\22current_line_only\2\16hint_offset\3????\15\17AFTER_CURSOR\15hint_char1r\0\0\4\2\4\0\b-\0\0\0009\0\0\0005\2\2\0-\3\1\0009\3\1\3=\3\3\2B\0\2\1K\0\1\0\0?\1?\14direction\1\0\2\22current_line_only\2\16hint_offset\3\1\18BEFORE_CURSOR\15hint_char1?\2\1\0\b\0\21\0,6\0\0\0'\2\1\0B\0\2\0029\1\2\0004\3\0\0B\1\2\0016\1\0\0'\3\3\0B\1\2\0029\1\4\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\t\0003\6\n\0005\a\v\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\f\0003\6\r\0005\a\14\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\15\0003\6\16\0005\a\17\0B\2\5\0016\2\5\0009\2\6\0029\2\a\2'\4\b\0'\5\18\0003\6\19\0005\a\20\0B\2\5\0012\0\0?K\0\1\0\1\0\1\nremap\2\0\6T\1\0\1\nremap\2\0\6t\1\0\1\nremap\2\0\6F\1\0\1\nremap\2\0\6f\5\bset\vkeymap\bvim\18HintDirection\rhop.hint\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n\127\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\26code_action_lightbulb\1\0\0\1\0\2\venable\1\21enable_in_insert\1\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\vwindow\1\0\0\1\0\2\nwidth\4????\3????\3\rbackdrop\3\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n?\2\0\0\4\0\f\0\0156\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\4\0'\2\5\0B\0\2\0029\0\6\0005\2\b\0005\3\a\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\21filetype_exclude\1\6\0\0\thelp\14dashboard\vpacker\rNvimTree\ttext\20buftype_exclude\1\0\4\19use_treesitter\2\25show_current_context\2\28show_first_indent_level\2#show_trailing_blankline_indent\1\1\3\0\0\rterminal\vnofile\nsetup\21indent_blankline\frequire\1\5\0\0\6|\a??\b???\b???\25indentLine_char_list\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25plugins-opts.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n?\f\0\0\5\0B\0G6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0024\3\0\0=\3\n\0024\3\0\0=\3\v\0025\3\r\0005\4\f\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4 \0035\4!\0=\4\"\0035\4#\0=\4$\0035\4%\0=\4&\0035\4'\0=\4(\0035\4)\0=\4*\0035\4+\0=\4,\0035\4-\0=\4.\0035\4/\0=\0040\0035\0041\0=\0042\0035\0043\0=\0044\0035\0045\0=\0046\0035\0047\0=\0048\0035\0049\0=\4:\0035\4;\0=\4<\0035\4=\0=\4>\0035\4?\0=\4@\3=\3A\2B\0\2\1K\0\1\0\fsymbols\18TypeParameter\1\0\2\ticon\t????\ahl\16TSParameter\rOperator\1\0\2\ticon\6+\ahl\15TSOperator\nEvent\1\0\2\ticon\t????\ahl\vTSType\vStruct\1\0\2\ticon\t????\ahl\vTSType\15EnumMember\1\0\2\ticon\b???\ahl\fTSField\tNull\1\0\2\ticon\tNULL\ahl\vTSType\bKey\1\0\2\ticon\t????\ahl\vTSType\vObject\1\0\2\ticon\b???\ahl\vTSType\nArray\1\0\2\ticon\b???\ahl\15TSConstant\fBoolean\1\0\2\ticon\b???\ahl\14TSBoolean\vNumber\1\0\2\ticon\6#\ahl\rTSNumber\vString\1\0\2\ticon\t????\ahl\rTSString\rConstant\1\0\2\ticon\b???\ahl\15TSConstant\rVariable\1\0\2\ticon\b???\ahl\15TSConstant\rFunction\1\0\2\ticon\b???\ahl\15TSFunction\14Interface\1\0\2\ticon\b???\ahl\vTSType\tEnum\1\0\2\ticon\b???\ahl\vTSType\16Constructor\1\0\2\ticon\b???\ahl\18TSConstructor\nField\1\0\2\ticon\b???\ahl\fTSField\rProperty\1\0\2\ticon\b???\ahl\rTSMethod\vMethod\1\0\2\ticon\a??\ahl\rTSMethod\nClass\1\0\2\ticon\t????\ahl\vTSType\fPackage\1\0\2\ticon\b???\ahl\16TSNamespace\14Namespace\1\0\2\ticon\b???\ahl\16TSNamespace\vModule\1\0\2\ticon\b???\ahl\16TSNamespace\tFile\1\0\0\1\0\2\ticon\b???\ahl\nTSURI\21symbol_blacklist\18lsp_blacklist\fkeymaps\nclose\1\0\v\19focus_location\6o\17hover_symbol\14<C-space>\18goto_location\t<Cr>\15fold_reset\6R\15unfold_all\6E\rfold_all\6W\vunfold\6l\tfold\6h\17code_actions\6a\18rename_symbol\6r\19toggle_preview\6K\1\3\0\0\n<Esc>\6q\17fold_markers\1\3\0\0\b???\b???\1\0\r\15auto_close\1\19relative_width\2\17auto_preview\1\16show_guides\2\27highlight_hovered_item\2\twrap\1\rposition\nright\nwidth\3\25\22auto_unfold_hover\2\25preview_bg_highlight\nPmenu\24show_symbol_details\2\26show_relative_numbers\1\17show_numbers\1\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\ny\0\1\5\2\4\0\14-\1\0\0009\1\0\1B\1\1\2\18\3\1\0009\1\1\1B\1\2\2\6\1\2\0X\2\5?-\2\1\0009\2\3\2B\2\1\2\18\4\0\0B\2\2\1K\0\1\0\1?\0?\20on_confirm_done\18named_imports\ttype\23get_node_at_cursor?\1\1\0\a\0\b\0\0176\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2\18\4\2\0009\2\5\2'\5\6\0003\6\a\0B\2\4\0012\0\0?K\0\1\0\0\17confirm_done\aon\nevent\bcmp\29nvim-treesitter.ts_utils\"nvim-autopairs.completion.cmp\frequire?\a\1\0\r\0&\1L6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1?2\0D?6\2\1\0'\4\3\0B\2\2\0029\3\4\0015\5\5\0005\6\6\0=\6\a\0055\6\t\0005\a\b\0=\a\n\0065\a\v\0=\a\f\6=\6\r\0055\6\14\0=\6\15\0056\6\16\0009\6\17\6'\b\18\0'\t\19\0'\n\20\0B\6\4\2=\6\21\0055\6\22\0005\a\23\0=\a\24\0066\a\16\0009\a\17\a'\t\25\0'\n\19\0'\v\20\0B\a\4\2=\a\26\6=\6\27\5B\3\2\0016\3\1\0'\5\28\0B\3\2\0029\4\29\0014\6\3\0\18\a\2\0'\t\30\0'\n\30\0'\v\n\0B\a\4\2\18\t\a\0009\a\31\a9\n \0035\f!\0B\n\2\0A\a\1\2>\a\1\6\18\a\2\0'\t\"\0'\n\"\0'\v\n\0B\a\4\2\18\t\a\0009\a\31\a9\n#\0035\f$\0B\n\2\0A\a\1\0?\a\0\0B\4\2\0016\4\0\0003\6%\0B\4\2\1K\0\1\0K\0\1\0\0\1\2\0\0\rfunction\19is_not_ts_node\6$\1\3\0\0\vstring\fcomment\15is_ts_node\14with_pair\6%\14add_rules\28nvim-autopairs.ts-conds\14fast_wrap\fpattern\25 [%'%\"%)%>%]%)%}%,] \nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\14highlight\vSearch\19highlight_grey\fComment\16check_comma\2\tkeys\31qwertyuiopzxcvbnmasdfghjkl\fend_key\6$\voffset\3\0\bmap\n<M-e>\22ignored_next_char\5\b%s+\21 [%w%%%'%[%\"%.] \tgsub\vstring\21disable_filetype\1\3\0\0\20TelescopePrompt\18spectre_panel\14ts_config\15javascript\1\3\0\0\vstring\20template_string\blua\1\0\1\tjava\1\1\3\0\0\vstring\vsource\rmap_char\1\0\2\btex\6{\ball\6(\1\0\t\vmap_bs\2\22enable_afterquote\2\21enable_moveright\2\vactive\2\21disable_in_macro\1\27disable_in_visualblock\1\rcheck_ts\2\30enable_check_bracket_line\1\fmap_c_w\1\nsetup\24nvim-autopairs.rule\19nvim-autopairs\frequire\npcall\5????\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: markdown-preview.nvim
time([[Config for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\nlight\15mkdp_theme\6g\bvim\0", "config", "markdown-preview.nvim")
time([[Config for markdown-preview.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n?\1\0\0\3\0\5\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\4\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\"luasnip.loaders.from_snipmate luasnip.loaders.from_vscode\14lazy_load\29luasnip.loaders.from_lua\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n?\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15highlights\vNormal\1\0\0\1\0\1\tlink\vNormal\15float_opts\1\0\1\rwinblend\3\0\1\0\1\tsize\3\20\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\nO\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\29????????????????????????\25floaterm_borderchars\6g\bvim\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\n?\3\0\0\5\0\r\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\0034\4\0\0=\4\t\0034\4\0\0=\4\n\0034\4\0\0=\4\v\0034\4\0\0=\4\f\3B\1\2\1K\0\1\0%providers_regex_syntax_allowlist$providers_regex_syntax_denylist\20modes_allowlist\19modes_denylist\24filetypes_allowlist\23filetypes_denylist\1\t\0\0\14dashboard\rNvimTree\vpacker\fOutline\rterminal\rfloaterm\15toggleterm\20TelescopePrompt\14providers\1\0\2\ndelay\3?\a\17under_cursor\2\1\4\0\0\blsp\15treesitter\nregex\14configure\15illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
