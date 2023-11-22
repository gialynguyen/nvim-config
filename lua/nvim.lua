vim.o.cursorline = false
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
vim.o.autoindent = false
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.laststatus = 3
vim.wo.wrap = true
vim.wo.list = false
vim.wo.linebreak = true

vim.g.mapleader = "\\"
vim.g.loaded_matchparen = false

vim.o.mouse = "a"
vim.o.inccommand = "nosplit"

vim.g.VM_set_statusline = 0
vim.g.VM_silent_exit = 1

local aug = vim.api.nvim_create_augroup("buf_large", { clear = true })

vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  callback = function()
    local max_size = 1024 * 50
    local bufnr = vim.api.nvim_get_current_buf()
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
    if ok and stats and ((stats.size > max_size) or (vim.api.nvim_buf_line_count(bufnr) > 5000)) then
      vim.b.large_buf = true
      vim.cmd "IlluminatePauseBuf"
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.spell = false
    else
      vim.b.large_buf = false
    end
  end,
  group = aug,
  pattern = "*",
})
