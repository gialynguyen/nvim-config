vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 100
vim.o.autoindent = true
vim.g.mapleader = ","

vim.opt.mouse = "a"
vim.opt.inccommand = "nosplit"

vim.cmd "sign define DiagnosticSignError text=● texthl=DiagnosticSignError"
vim.cmd "sign define DiagnosticSignWarn text=● texthl=DiagnosticSignWarn"
vim.cmd "sign define DiagnosticSignInfo text=● texthl=DiagnosticSignInfo"
vim.cmd "sign define DiagnosticSignHint text=● texthl=DiagnosticSignHint"
