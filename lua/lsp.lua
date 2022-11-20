local servers = {
	"bashls",
	"clangd",
	"cssls",
	"cssmodules_ls",
	"gopls",
	"html",
	"eslint",
	"pyright",
	"rust_analyzer",
	"sumneko_lua",
	"tailwindcss",
	"tsserver",
	"flow",
	"astro",
}
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
	tailwindcss = function(opts)
		opts.autostart = false
	end,
	cssmodules_ls = function(opts)
		opts.autostart = false
	end,
}

local navic = require "nvim-navic"
local lspconfig = require "lspconfig"

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
				vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
			end
		end,
		autostart = true,
		capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
			"vue",
		}

		server:setup(opts)
		return
	end

	if server.name == "eslint" then
		opts.handlers = {
			["window/showMessageRequest"] = function(_, result, params)
				return result
			end,
		}

		server:setup(opts)
		return
	end

	server:setup(opts)
end)

lspconfig.emmet_ls.setup {
	capabilities = capabilities,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
	init_options = {
		html = {
			options = {
				["bem.enabled"] = true,
			},
		},
	},
}

vim.diagnostic.config {
	virtual_text = false,
	signs = false,
	underline = true,
	virtual_lines = false,
}
