local indent_blankline = require "ibl"

indent_blankline.setup {
  exclude = {
    filetypes = {
      "help",
      "dashboard",
      "packer",
      "NvimTree",
      "text",
    },
    buftypes = {
      "terminal",
      "nofile",
    },
  },
  indent = {
    char = "",
  },
  scope = {
    enabled = true,
    char = "│",
  },
}
