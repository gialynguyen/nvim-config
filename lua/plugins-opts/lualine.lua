local lualine = require "lualine"

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand "%:t") ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand "%:p:h"
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  extensions = { "nvim-tree" },
  options = {
    disabled_filetypes = {},
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    globalstatus = true,
    -- theme = {
    --   normal = { c = { fg = colors.fg, bg = colors.bg } },
    --   inactive = { c = { fg = colors.fg, bg = colors.bg } },
    -- },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return "▊"
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  "mode",
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.green,
      i = colors.yellow,
      v = colors.blue,
      [""] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  function()
    return "Steven"
  end,
  color = {
    fg = "#3c3836",
    bg = "#ebdbb2",
  },
}

ins_left {
  "branch",
  icon = "",
  color = { fg = colors.violet, gui = "bold" },
}

ins_left {
  function()
    return vim.fn.expand "%:h:t" .. "/" .. vim.fn.expand "%:t"
  end,
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = "bold" },
}

ins_left {
  "diff",
  symbols = { added = " ", modified = "󰝤 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_left {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
  cond = conditions.hide_in_width,
}

-- Add components to right sections
ins_right {
  "searchcount",
}

ins_right {
  "filetype",
  icons_enabled = true,
  color = { fg = colors.red, gui = "bold" },
}

ins_right {
  "fileformat",
  icons_enabled = true,
  symbols = {
    unix = "LF",
    dos = "CRLF",
    mac = "CR",
  },
}

ins_right { "encoding", color = { fg = colors.magenta } }

ins_right { "location" }

ins_right {
  function()
    local space = vim.fn.search([[\s\+$]], "nwc")
    return space ~= 0 and "TW:" .. space or ""
  end,
}

ins_right {
  function()
    local space_pat = [[\v^ +]]
    local tab_pat = [[\v^\t+]]
    local space_indent = vim.fn.search(space_pat, "nwc")
    local tab_indent = vim.fn.search(tab_pat, "nwc")
    local mixed = (space_indent > 0 and tab_indent > 0)
    local mixed_same_line

    if not mixed then
      mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
      mixed = mixed_same_line > 0
    end

    if not mixed then
      return (space_indent > 0 and "Spaces: " .. vim.o.shiftwidth) or ("Tabs: " .. vim.o.tabstop)
    end

    if mixed_same_line ~= nil and mixed_same_line > 0 then
      return "MI:" .. mixed_same_line
    end

    local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
    local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
    if space_indent_cnt > tab_indent_cnt then
      return "MI:" .. tab_indent
    else
      return "MI:" .. space_indent
    end
  end,
  color = { fg = colors.yellow },
}

ins_right { "progress", color = { fg = colors.fg, gui = "bold" } }

ins_right {
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

lualine.setup(config)
