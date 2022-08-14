local servers = {
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
	"gopls",
	"html",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	"flow",
}

local has_formatter = { "gopls", "html", "rust_analyzer", "sumneko_lua", "tsserver", "cssls", "cssmodules_ls" }
for _, name in pairs(servers) do
	local found, server = require("nvim-lsp-installer").get_server(name)
	if found and not server:is_installed() then
		print("Installing " .. name)
		server:install()
	end
end
local setup_server = {
	sumneko_lua = function(opts)
		opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
	end,
}

local lspconfig = require "lspconfig"

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			local opts = { buffer = bufnr, noremap = true, silent = true }

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.range_formatting, opts)

			local should_format = true
			for _, value in pairs(has_formatter) do
				if client.name == value then
					should_format = false
				end
			end
			if not should_format then
				client.resolved_capabilities.document_formatting = false
			end
		end,
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	}
	if setup_server[server.name] then
		setup_server[server.name](opts)
	end

	if server.name == "tsserver" then
		opts.root_dir = function(fname)
			return lspconfig.util.root_pattern "tsconfig.json"(fname)
				or not lspconfig.util.root_pattern ".flowconfig"(fname)
					and lspconfig.util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
		end

		opts.capabilities = capabilities

		server:setup(opts)
		return
	end

	if server.name == "volar" then
		opts.filetypes = {
			-- "typescript",
			-- "javascript",
			"vue",
		}

		server:setup(opts)
		return
	end
	server:setup(opts)
end)

lspconfig.flow.setup {
	capabilities = capabilities,
}
