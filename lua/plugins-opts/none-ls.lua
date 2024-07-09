local function is_js_ts_jsx_tsx_file(bufnr)
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local extension = bufname:match "^.+(%..+)$"
  return extension == ".js" or extension == ".ts" or extension == ".jsx" or extension == ".tsx"
end

local async_formatting = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if is_js_ts_jsx_tsx_file(bufnr) then
    vim.cmd "TSToolsOrganizeImports sync"
  end

  vim.lsp.buf_request(bufnr, "textDocument/formatting", vim.lsp.util.make_formatting_params {}, function(err, res, ctx)
    if err then
      local err_msg = type(err) == "string" and err or err.message
      -- you can modify the log message / level (or ignore it completely)
      vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
      return
    end

    if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
      return
    end

    if res then
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
      vim.api.nvim_buf_call(bufnr, function()
        vim.cmd "silent noautocmd update"
      end)
    end
  end)
end

local is_disable_none_ls = 0

local disable_none_ls = function()
  is_disable_none_ls = 1
end

local enable_none_ls = function()
  is_disable_none_ls = 0
end

vim.api.nvim_create_user_command("NoneLsDisable", disable_none_ls, {})
vim.api.nvim_create_user_command("NoneLsEnable", enable_none_ls, {})

local none_ls = require "null-ls"
local cspell = require "cspell"

local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
local cspell_config = {
  diagnostics_postprocess = function(diagnostic)
    diagnostic.severity = vim.diagnostic.severity["INFO"] -- ERROR, WARN, INFO, HINT
  end,
  config = {
    find_json = function(_)
      return vim.fn.expand "~/.config/cspell.json"
    end,
  },
}
none_ls.setup {
  sources = {
    none_ls.builtins.formatting.gofmt,
    none_ls.builtins.formatting.prettier.with {
      extra_filetypes = { "svelte" },
    },
    -- none_ls.builtins.formatting.rustfmt,
    none_ls.builtins.formatting.stylua,
    none_ls.builtins.code_actions.gitsigns,
    none_ls.builtins.diagnostics.stylelint.with {
      condition = function(utils)
        return utils.root_has_file {
          "stylelint.config.js",
          ".stylelintrc.js",
          ".stylelintrc",
          ".stylelintrc.json",
          ".stylelintrc.yml",
          ".stylelintrc.yaml",
        }
      end,
    },
    none_ls.builtins.formatting.stylelint.with {
      condition = function(utils)
        return utils.root_has_file {
          "stylelint.config.js",
          ".stylelintrc.js",
          ".stylelintrc",
          ".stylelintrc.json",
          ".stylelintrc.yml",
          ".stylelintrc.yaml",
        }
      end,
    },
    cspell.diagnostics.with {
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "rust",
        "go",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "liquid",
      },
      diagnostics_postprocess = function(diagnostic)
        diagnostic.severity = vim.diagnostic.severity.HINT
      end,
    },
    cspell.code_actions.with {
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "rust",
        "go",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "liquid",
      },
    },
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          if is_disable_none_ls == 0 then
            async_formatting(bufnr)
          end
        end,
      })
    end
  end,
}
