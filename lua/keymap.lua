vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<Leader>fd", require("telescope.builtin").fd)
vim.keymap.set("n", "<Leader>fg", require("telescope.builtin").git_status)
vim.keymap.set("n", "<Leader>t", require("telescope.builtin").treesitter)
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>rg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>rr", "<cmd>Telescope resume<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>re", require("telescope.builtin").oldfiles)

vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { noremap = true, silent = true })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)

vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations)
vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions)

vim.keymap.set("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>[", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

vim.keymap.set("n", "<leader>]", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

vim.keymap.set(
	"n",
	"[e",
	"<cmd>lua vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR } })<CR>",
	opts
)

vim.keymap.set(
	"n",
	"]e",
	"<cmd>lua vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR } })<CR>",
	opts
)

vim.keymap.set("n", "<leader>db", "<cmd>Dashboard<CR>")

vim.keymap.set("n", "<c-b>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<c-f>", "<cmd>NvimTreeFindFile<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>NvimTreeFocus<CR>")

vim.keymap.set("", "<Leader>x", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

require("toggleterm").setup {
	open_mapping = [[<C-\>]],
}

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<C-e>", [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

local goBackAndCloseCurrentBuf = function()
	local buf_id = vim.api.nvim_get_current_buf()
	require("bufjump").backward()
	vim.api.nvim_command(string.format("bdelete %d", buf_id))
end

vim.keymap.set("n", "<c-c>", goBackAndCloseCurrentBuf)

local Wrapline = function()
	vim.api.nvim_command(string.format "wrap")
end

local Nowrapline = function()
	vim.api.nvim_command(string.format "nowrap")
end

vim.api.nvim_create_user_command("Wrapline", Wrapline, {})
vim.api.nvim_create_user_command("Nowrapline", Nowrapline, {})
