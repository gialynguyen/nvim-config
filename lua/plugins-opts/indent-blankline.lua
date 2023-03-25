local indent_blankline = require "indent_blankline"

indent_blankline.setup {
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "dashboard",
    "packer",
    "NvimTree",
    "text",
  },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = true,
  char = "",
  context_char = "│",
  show_current_context_start = true,
}
