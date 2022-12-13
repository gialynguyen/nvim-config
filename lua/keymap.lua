-- Telescope keymap
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fd", builtin.fd)
vim.keymap.set("n", "<leader>gs", builtin.git_status)
vim.keymap.set("n", "<leader>gf", builtin.git_files)
vim.keymap.set("n", "<leader>t", builtin.treesitter)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>rg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set("n", "<leader>rr", builtin.resume)
vim.keymap.set("n", "<leader>re", ":lua require('telescope.builtin').oldfiles({ only_cwd = true })<CR>")

--- Git Keymap

vim.keymap.set("n", "]c", "<cmd>Gitsigns next_hunk<CR>")
vim.keymap.set("n", "[c", "<cmd>Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>go", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>")
vim.keymap.set("n", "<leader>gH", "<cmd>DiffviewFileHistory<CR>")

--- LSP keymap

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gr", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "<leader>ac", "<Cmd>Lspsaga code_action<CR>", opts)

vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations)
vim.keymap.set("n", "gt", require("telescope.builtin").lsp_type_definitions)

vim.keymap.set("n", "<leader>da", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
vim.keymap.set("n", "<leader>do", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

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

vim.keymap.set("", "<c-k>", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

-- NvimTree Keymap

vim.keymap.set("n", "<c-j>", "<cmd>NvimTreeToggle<CR>")
vim.keymap.set("n", "<c-g>", "<cmd>NvimTreeFindFile<CR>")
vim.keymap.set("n", "<c-l>", "<cmd>NvimTreeFocus<CR>")

-- Terminal Keymap

require("toggleterm").setup {
  open_mapping = [[<C-t>]],
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<C-e>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-z>", [[<C-\><C-n><cmd>resize 15<CR>a]], opts)
  vim.api.nvim_buf_set_keymap(0, "n", "<C-z>", [[<C-\><C-n><cmd>resize 15<CR>a]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"

-- Buffers Keymap
local goBackBuffer = function()
  vim.api.nvim_command(string.format "BufSurfBack")
  vim.cmd [[execute "normal! g`\"zz"]]

  vim.fn.jobstart "sleep 1 && lua require('bufferline.ui').refresh()"
end

local goForwardBuffer = function()
  vim.api.nvim_command(string.format "BufSurfForward")
  vim.cmd [[execute "normal! g`\"zz"]]

  vim.fn.jobstart "sleep 1 && lua require('bufferline.ui').refresh()"
end

local goBackAndCloseCurrentBuf = function()
  local buf_id = vim.api.nvim_get_current_buf()
  goBackBuffer()
  vim.api.nvim_command(string.format("bwipeout %d", buf_id))
end

local closeHiddenBuffers = function()
  local buffers = vim.api.nvim_list_bufs()
  local non_hidden_buffer = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    non_hidden_buffer[vim.api.nvim_win_get_buf(win)] = true
  end

  for _, buffer in ipairs(buffers) do
    local filetype = vim.fn.getbufvar(buffer, "&buftype")
    if non_hidden_buffer[buffer] == nil and filetype ~= "terminal" then
      vim.api.nvim_command(string.format("bwipeout %d", buffer))
    end
  end

  require("bufferline.ui").refresh()
end

vim.keymap.set("n", "<Leader>w", closeHiddenBuffers)
vim.keymap.set("n", "<c-x>", goBackAndCloseCurrentBuf)
vim.keymap.set("n", "]b", goForwardBuffer)
vim.keymap.set("n", "[b", goBackBuffer)

vim.keymap.set("n", "<leader>q", "<cmd>bp<CR><cmd>bd #<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>bp<CR><cmd>bd #<CR><cmd>q<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>bprevious<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>bnext<CR>")

function GotoBuffer(index)
  require("nvim-smartbufs").goto_buffer(index)
end

function CloseBuffer(index)
  require("nvim-smartbufs").close_buffer(index)
  vim.fn.jobstart "sleep 1 && lua require('bufferline.ui').refresh()"
end

for i = 1, 9 do
  vim.keymap.set("n", ("<Leader>%s"):format(i), ("<Cmd>lua GotoBuffer(%s)<CR>"):format(i), { silent = true })
  vim.keymap.set("n", ("<Leader>c%s"):format(i), ("<Cmd>lua CloseBuffer(%s)<CR>"):format(i), { silent = true })
end

-- Others

local Wrapline = function()
  vim.api.nvim_command(string.format "set wrap")
end

local Nowrapline = function()
  vim.api.nvim_command(string.format "set nowrap")
end

vim.api.nvim_create_user_command("Wrapline", Wrapline, {})
vim.api.nvim_create_user_command("Nowrapline", Nowrapline, {})

vim.keymap.set("n", "<F8>", "<Cmd>SymbolsOutline<CR>")
vim.keymap.set("n", "<leader>db", "<cmd>Dashboard<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>Q", "<cmd>tabc<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>za", "<cmd>ZenMode<CR>", { noremap = true, silent = true })

--- illuminate keymap for MacOS (stupid) ---
vim.keymap.set("n", "˜", require("illuminate").goto_next_reference, { desc = "Move to next reference" })
vim.keymap.set("n", "π", require("illuminate").goto_prev_reference, { desc = "Move to previous reference" })
