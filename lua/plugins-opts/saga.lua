local saga = require "lspsaga"
saga.setup {
  lightbulb = {
    enable = false,
    enable_in_insert = false,
  },
  ui = {
    border = "rounded",
    colors = {
      normal_bg = "NONE",
      title_bg = "NONE",
    },
  },
  diagnostic = {
    on_insert = false,
  },
}
