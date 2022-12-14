require("mason").setup {
  ui = {
    border = "rounded",
  },
}

require("mason-lspconfig").setup {
  ensure_installed = {
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
    "astro",
  },
  automatic_installation = false,
}

require("mason-lspconfig").setup_handlers {
  function(server_name)
    local navic = require "nvim-navic"
    local lspconfig = require "lspconfig"

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
    capabilities.textDocument.completion.completionItem.snippetSupport = true

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
      tsserver = function(opts)
        opts.root_dir = function(fname)
          return lspconfig.util.root_pattern "tsconfig.json"(fname)
            or not lspconfig.util.root_pattern ".flowconfig"(fname)
              and lspconfig.util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
        end

        opts.capabilities = capabilities
      end,
      volar = function(opts)
        opts.filetypes = {
          "vue",
        }
      end,
      eslint = function(opts)
        opts.handlers = {
          ["window/showMessageRequest"] = function(_, result, params)
            return result
          end,
        }
      end,
    }

    local opts = {
      on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
          vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
        end

        require("lsp_signature").on_attach({
          bind = true, -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
            border = "rounded",
          },
          hint_enable = false,
        }, bufnr)
      end,
      autostart = true,
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    if setup_server[server_name] then
      setup_server[server_name](opts)
    end

    lspconfig[server_name].setup(opts)
  end,
}

vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  underline = true,
  virtual_lines = false,
}
