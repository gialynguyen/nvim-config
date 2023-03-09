local bufferline = require "bufferline"

local highlights = {
  background = {
    fg = "NONE",
    bg = "NONE",
  },
  buffer = {
    fg = "NONE",
    bg = "NONE",
  },
  buffer_visible = {
    fg = "NONE",
    bg = "NONE",
  },
  buffer_selected = {
    fg = "#d8a657",
    bg = "NONE",
  },
}

local close_func = function(bufnum)
  local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
  if bufdelete_avail then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd["bdelete!"] { args = { bufnum } }
  end
end

bufferline.setup {
  options = {
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 },
      { filetype = "neo-tree", text = "", padding = 1 },
      { filetype = "Outline",  text = "", padding = 1 },
    },
    numbers = "ordinal",
    buffer_close_icon = "",
    modified_icon = "",
    close_icon = "",
    close_command = close_func,
    right_mouse_command = close_func,
    -- max_name_length = 14,
    -- max_prefix_length = 13,
    -- tab_size = 20,
    separator_style = "thin",
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(_, _, diagnostics, _)
      local result = {}
      local symbols = {
        error = "",
        warning = "",
        info = "",
      }

      for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
          table.insert(result, symbols[name] .. " " .. count)
        end
      end

      local result_string = table.concat(result, " ")
      return #result > 0 and result_string or ""
    end,
  },
  highlights = highlights,
}

local refresh_ui = function()
  if vim.g.transparent_enabled == true then
    -- vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE", fg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineBackcrust", { bg = "NONE", fg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { bg = "NONE", fg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineTabClose", { bg = "NONE", fg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "NONE", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { fg = "NONE", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = "NONE", bg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineCloseButton", { bg = "NONE", fg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", { bg = "NONE", fg = "NONE" })
    -- vim.api.nvim_set_hl(0, "BufferLineOffsetSeparator", { bg = "NONE", fg = "NONE" })
    local inactive_bg = "NONE"
    local active_bg = "NONE"
    local separator_fg = "NONE"
    local bg_highlight = "NONE"

    highlights = {
      background = { bg = inactive_bg },
      buffer_visible = { bg = inactive_bg },
      buffer_selected = { bg = active_bg }, -- current
      -- Duplicate
      duplicate_selected = { bg = active_bg },
      duplicate_visible = { bg = inactive_bg, },
      duplicate = { bg = inactive_bg },
      -- tabs
      tab = { bg = inactive_bg },
      tab_selected = { bg = active_bg },
      tab_close = { bg = inactive_bg },
      indicator_selected = { bg = active_bg, },
      -- separators
      separator = { fg = separator_fg, bg = inactive_bg },
      separator_visible = { fg = separator_fg, bg = inactive_bg },
      separator_selected = { fg = separator_fg, bg = active_bg },
      offset_separator = { fg = separator_fg, bg = active_bg },
      -- close buttons
      close_button = { bg = inactive_bg },
      close_button_visible = { bg = inactive_bg },
      close_button_selected = { bg = active_bg },
      -- Empty fill
      fill = { bg = bg_highlight },
      -- Numbers
      numbers = { bg = inactive_bg },
      numbers_visible = { bg = inactive_bg },
      numbers_selected = { bg = active_bg },
      -- Errors
      error = { bg = inactive_bg },
      error_visible = { bg = inactive_bg },
      error_selected = { bg = active_bg },
      error_diagnostic = { bg = inactive_bg },
      error_diagnostic_visible = { bg = inactive_bg },
      error_diagnostic_selected = { bg = active_bg },
      -- Warnings
      warning = { bg = inactive_bg },
      warning_visible = { bg = inactive_bg },
      warning_selected = { bg = active_bg, },
      warning_diagnostic = { bg = inactive_bg },
      warning_diagnostic_visible = { bg = inactive_bg },
      warning_diagnostic_selected = { bg = active_bg },
      -- Infos
      info = { bg = inactive_bg },
      info_visible = { bg = inactive_bg },
      info_selected = { bg = active_bg, },
      info_diagnostic = { bg = inactive_bg },
      info_diagnostic_visible = { bg = inactive_bg },
      info_diagnostic_selected = { bg = active_bg },
      -- Hint
      hint = { bg = inactive_bg },
      hint_visible = { bg = inactive_bg },
      hint_selected = { bg = active_bg, },
      hint_diagnostic = { bg = inactive_bg },
      hint_diagnostic_visible = { bg = inactive_bg },
      hint_diagnostic_selected = { bg = active_bg },
      -- Diagnostics
      diagnostic = { bg = inactive_bg },
      diagnostic_visible = { bg = inactive_bg },
      diagnostic_selected = { bg = active_bg, },
      -- Modified
      modified = { bg = inactive_bg },
      modified_selected = { bg = active_bg },
    }

    require('bufferline.ui').refresh()
  end
end

vim.api.nvim_create_user_command("BufferLineRefreshUI", refresh_ui, {})

-- vim.cmd [[
--  autocmd ColorScheme * highlight BufferLineFill guibg=none
--  autocmd ColorScheme * highlight BufferLineBackground guifg=none
--  autocmd ColorScheme * highlight BufferLineBufferSelected guifg=none gui=none
--  ]]
