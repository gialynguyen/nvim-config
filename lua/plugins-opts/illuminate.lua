local illuminate = require "illuminate"
illuminate.configure {
  should_enable = function()
    return true
  end,
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 1000,
  filetypes_denylist = {
    "dashboard",
    "NvimTree",
    "packer",
    "Outline",
    "terminal",
    "floaterm",
    "toggleterm",
    "TelescopePrompt",
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
}
