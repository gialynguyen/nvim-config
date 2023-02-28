require("nvim-tree").setup {
  sync_root_with_cwd = true,
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

local api = require "nvim-tree.api"
local Event = api.events.Event

local need_workaround_update_colorschema = false

vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  callback = function()
    need_workaround_update_colorschema = true
  end,
})

api.events.subscribe(Event.TreeOpen, function()
  if vim.g.transparent_enabled == true then
    pcall(vim.cmd, string.format("hi %s ctermbg=NONE guibg=NONE", "NvimTreeNormal"))
    pcall(vim.cmd, string.format("hi %s ctermbg=NONE guibg=NONE", "NvimTreeStatuslineNc"))
    pcall(vim.cmd, string.format("hi %s ctermbg=NONE guibg=NONE", "NvimTreeEndOfBuffer"))
  end

  if need_workaround_update_colorschema == true then
    vim.api.nvim_command(string.format("colorscheme %s", vim.g.colors_name))
    need_workaround_update_colorschema = false
  end
end)
