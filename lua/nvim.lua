vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.updatetime = 100
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.fillchars = "eob: "
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldenable = false
vim.wo.wrap = true
vim.wo.list = false
vim.wo.linebreak = true

vim.g.mapleader = ","

vim.o.mouse = "a"
vim.o.inccommand = "nosplit"

vim.g.VM_set_statusline = 0
vim.g.VM_silent_exit = 1

local vim = vim
local api = vim.api
local M = {}
-- function to create a list of commands and convert them to autocommands
-------- This function is taken from https://github.com/norcalli/nvim_utils
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command("augroup " .. group_name)
    api.nvim_command "autocmd!"
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten { "autocmd", def }, " ")
      api.nvim_command(command)
    end
    api.nvim_command "augroup END"
  end
end

local autoCommands = {
  -- other autocommands
  open_folds = {
    { "BufReadPost,FileReadPost", "*", "normal zR" },
  },
}

M.nvim_create_augroups(autoCommands)

local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function()
    local max_size = 1024 * 50;
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and (stats.size > max_size) then
      vim.b.large_buf = true
      -- vim.cmd "syntax off"
      vim.cmd "IlluminatePauseBuf"
      vim.cmd "IndentBlanklineDisable"
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
    else
      vim.b.large_buf = false
    end
  end,
  group = aug,
  pattern = "*",
})
