local saga = require "lspsaga"
saga.setup {
  lightbulb = {
    enable = false,
    enable_in_insert = false,
  },
  ui = {
    winblend = 0,
    border = "rounded",
    colors = {
      normal_bg = "NONE",
    },
  },
  diagnostic = {
    on_insert = false,
  },
}
