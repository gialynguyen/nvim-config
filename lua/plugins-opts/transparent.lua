vim.g.transparent_enabled = true

local transparent = require "transparent"
transparent.setup {
  extra_groups = {
    "NormalFloat",
    "NvimTreeNormal",
    "FloatBorder",
  },
}

transparent.clear_prefix "BufferLine"
transparent.clear_prefix "NvimTree"
transparent.clear_prefix "lualine"
transparent.clear_prefix "Ufo"
transparent.clear_prefix "Fold"
