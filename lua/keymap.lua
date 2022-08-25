vim.keymap.set("n", "<Leader>n", require("telescope").extensions.file_browser.file_browser)
vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<Leader>fd", require("telescope.builtin").fd)
vim.keymap.set("n", "<Leader>fg", require("telescope.builtin").git_status)
vim.keymap.set("n", "<Leader>t", require("telescope.builtin").treesitter)
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>rg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>re", require("telescope.builtin").oldfiles)

-- vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations)
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references)
vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions)
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>")

vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>]", "<cmd>lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>db", "<cmd>Dashboard<CR>")

vim.keymap.set("n", "<leader>x", require("lsp_lines").toggle)

vim.keymap.set("n", "<c-b>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<c-f>", "<cmd>NvimTreeFindFile<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>NvimTreeFocus<CR>")

require("toggleterm").setup {
	open_mapping = [[<C-\>]],
}

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
