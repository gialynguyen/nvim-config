local dashboard = require "dashboard"

dashboard.setup {
  theme = "doom",
  config = {
    header = {

      "",
      "",
      "",
      "",
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      "",
      "",
      "",
    },
    center = {
      {
        icon = " ",
        desc = "Recently latest session      ",
        action = "SessionManager load_session",
      },
      {
        icon = " ",
        desc = "Recently opened files    ",
        action = "Telescope oldfiles",
        shortcut = ", re",
      },
      {
        icon = " ",
        desc = "New File                  ",
        action = "DashboardNewFile",
        shortcut = ", o",
      },
      {
        icon = " ",
        desc = "Browse Files              ",
        action = "Telescope file_browser",
        shortcut = ", n",
      },
      {
        icon = " ",
        desc = "Find File                 ",
        action = "Telescope find_files",
        shortcut = ", f",
      },
      {
        icon = " ",
        desc = "Configure Neovim          ",
        action = "edit ~/.config/nvim/init.lua",
        shortcut = ", v",
      },
      {
        icon = " ",
        desc = "Exit Neovim                  ",
        action = "quit",
      },
    },
  },
}
