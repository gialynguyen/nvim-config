vim.keymap.set("n", "<Leader>n", require("telescope").extensions.file_browser.file_browser)
vim.keymap.set("n", "<Leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<Leader>t", require("telescope.builtin").treesitter)
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>rg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>re", require("telescope.builtin").oldfiles)

vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>db", "<cmd>Dashboard<CR>")

vim.keymap.set("n", "<leader>x", require("lsp_lines").toggle)

vim.keymap.set("n", "<c-b>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<c-f>", "<cmd>NvimTreeFindFile<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>NvimTreeFocus<CR>")
