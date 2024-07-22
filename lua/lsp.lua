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
    "tailwindcss",
    "tsserver",
    "astro",
  },
  automatic_installation = false,
}

require("mason-lspconfig").setup_handlers {
  function(server_name)
    local lspconfig = require "lspconfig"

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local setup_server = {
      tailwindcss = {
        autostart = false,
      },
      tsserver = {
        autostart = false,
      },
      cssmodules_ls = {
        autostart = false,
      },
      denols = {
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      },
      volar = {
        filetypes = {
          "vue",
        },
      },
      eslint = {
        handlers = {
          ["window/showMessageRequest"] = function(_, result, params)
            return result
          end,
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      },
    }

    local default_opts = {
      on_attach = function(client, bufnr)
        if client.name == "svelte" then
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
            callback = function(ctx)
              -- Here use ctx.match instead of ctx.file
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })
        end
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end,
      autostart = true,
      capabilities = capabilities,
    }
    --
    -- if server_name == "tsserver" then
    --   require("typescript").setup {
    --     disable_commands = false,
    --     debug = false,
    --     go_to_source_definition = {
    --       fallback = true,
    --     },
    --     server = {
    --       on_attach = function(client, bufnr)
    --         vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    --       end,
    --       autostart = true,
    --       capabilities = capabilities,
    --       root_dir = function(fname)
    --         return lspconfig.util.root_pattern ".git"(fname)
    --       end,
    --     },
    --   }
    --   return
    -- end
    --
    local opts = vim.tbl_deep_extend("force", default_opts, setup_server[server_name] or {})

    lspconfig[server_name].setup(opts)
  end,
}

vim.diagnostic.config {
  virtual_text = false,
  signs = false,
  underline = true,
  virtual_lines = false,
}
