local bufferline = require "bufferline"

local close_func = function(bufnum)
  local bufdelete_avail, bufdelete = pcall(require, "bufdelete")
  if bufdelete_avail then
    bufdelete.bufdelete(bufnum, true)
  else
    vim.cmd["bdelete!"] { args = { bufnum } }
  end
end

local refresh_ui = function()
  if vim.g.transparent_enabled == true then
    vim.cmd [[
      hi BufferLineFill guibg=NONE guifg=NONE
      hi BufferLineBackground guibg=NONE guifg=NONE

      hi BufferLineTab guibg=NONE guifg=NONE
      hi BufferLineTabSelected guibg=NONE guifg=NONE
      hi BufferLineTabClose guibg=NONE guifg=NONE
      hi BufferLineTabSeparator guibg=NONE guifg=NONE
      hi BufferLineTabSelected guibg=NONE guifg=NONE

      hi BufferLineNumbers guibg=NONE guifg=NONE

      hi BufferLineDuplicate guibg=NONE guifg=NONE

      hi BufferLineDiagnostic guibg=NONE guifg=NONE
      hi BufferLineDiagnosticVisble guibg=NONE guifg=NONE
      hi BufferLineDiagnosticSelected guibg=NONE guifg=NONE

      hi BufferLineError guibg=NONE guifg=NONE
      hi BufferLineErrorVisible guibg=NONE guifg=NONE
      hi BufferLineErrorSelected guibg=NONE guifg=NONE
      hi BufferLineErrorDiagnostic guibg=NONE guifg=NONE
      hi BufferLineErrorDiagnosticSelected guibg=NONE guifg=NONE
      hi BufferLineErrorDiagnosticVisible guibg=NONE guifg=NONE

      hi BufferLineWarning guibg=NONE guifg=NONE
      hi BufferLineWarningVisible guibg=NONE guifg=NONE
      hi BufferLineWarningSelected guibg=NONE guifg=NONE
      hi BufferLineWarningDiagnostic guibg=NONE guifg=NONE
      hi BufferLineWarningDiagnosticSelected guibg=NONE guifg=NONE
      hi BufferLineWarningDiagnosticVisible guibg=NONE guifg=NONE

      hi BufferLineInfo guibg=NONE guifg=NONE
      hi BufferLineInfoVisible guibg=NONE guifg=NONE
      hi BufferLineInfoSelected guibg=NONE guifg=NONE
      hi BufferLineInfoDiagnostic guibg=NONE guifg=NONE
      hi BufferLineInfoDiagnosticSelected guibg=NONE guifg=NONE
      hi BufferLineInfoDiagnosticVisible guibg=NONE guifg=NONE

      hi BufferLineHint guibg=NONE guifg=NONE
      hi BufferLineHintVisible guibg=NONE guifg=NONE
      hi BufferLineHintSelected guibg=NONE guifg=NONE
      hi BufferLineHintDiagnostic guibg=NONE guifg=NONE
      hi BufferLineHintDiagnosticSelected guibg=NONE guifg=NONE
      hi BufferLineHintDiagnosticVisible guibg=NONE guifg=NONE

      hi BufferLineCloseButton guibg=NONE guifg=NONE
      hi BufferLineCloseButtonVisible guibg=NONE guifg=NONE
      hi BufferLineCloseButtonSelected guibg=NONE guifg=NONE

      hi BufferLineBuffer guibg=NONE guifg=NONE
      hi BufferLineBufferVisible guibg=NONE guifg=NONE
      hi BufferLineBufferSelected guibg=NONE guifg=NONE

      hi BufferLineNumbers guibg=NONE guifg=NONE
      hi BufferLineNumbersVisible guibg=NONE guifg=NONE
      hi BufferLineNumbersSelected guibg=NONE guifg=NONE

      hi BufferLineModified guibg=NONE guifg=NONE
      hi BufferLineModifiedSelected guibg=NONE guifg=NONE
      hi BufferLineModifiedVisible guibg=NONE guifg=NONE

      hi BufferLineIndicator guibg=NONE guifg=NONE
      hi BufferLineIndicatorSelected guibg=NONE guifg=NONE

      hi BufferLineSeparator guibg=NONE guifg=NONE
      hi BufferLineSeparatorSelected guibg=NONE guifg=NONE
      hi BufferLineSeparatorVisible guibg=NONE guifg=NONE
      hi BufferLineOffsetSeparator guibg=NONE guifg=NONE
      hi BufferLineGroupSeparator guibg=NONE guifg=NONE

      hi BufferLineDuplicate guibg=NONE guifg=NONE
      hi BufferLineDuplicateVisible guibg=NONE guifg=NONE
      hi BufferLineDuplicateSelected guibg=NONE guifg=NONE
      ]]

    return {
      fill = {
        fg = "NONE",
        bg = "NONE",
      },
      background = {
        fg = "NONE",
        bg = "NONE",
      },
      tab = {
        fg = "NONE",
        bg = "NONE",
      },
      tab_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      tab_close = {
        fg = "NONE",
        bg = "NONE",
      },
      close_button = {
        fg = "NONE",
        bg = "NONE",
      },
      close_button_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      close_button_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      buffer_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      buffer_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      numbers = {
        fg = "NONE",
        bg = "NONE",
      },
      numbers_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      numbers_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      diagnostic = {
        fg = "NONE",
        bg = "NONE",
      },
      diagnostic_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      diagnostic_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      hint = {
        fg = "NONE",
        bg = "NONE",
      },
      hint_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      hint_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      hint_diagnostic = {
        fg = "NONE",
        bg = "NONE",
      },
      hint_diagnostic_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      hint_diagnostic_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      info = {
        fg = "NONE",
        sp = "NONE",
        bg = "NONE",
      },
      info_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      info_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      info_diagnostic = {
        fg = "NONE",
        bg = "NONE",
      },
      info_diagnostic_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      info_diagnostic_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      warning = {
        fg = "NONE",
        sp = "NONE",
        bg = "NONE",
      },
      warning_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      warning_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      warning_diagnostic = {
        fg = "NONE",
        bg = "NONE",
      },
      warning_diagnostic_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      warning_diagnostic_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      error = {
        fg = "NONE",
        bg = "NONE",
      },
      error_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      error_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      error_diagnostic = {
        fg = "NONE",
        bg = "NONE",
      },
      error_diagnostic_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      error_diagnostic_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      modified = {
        fg = "NONE",
        bg = "NONE",
      },
      modified_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      modified_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      duplicate_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      duplicate_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      duplicate = {
        fg = "NONE",
        bg = "NONE",
      },
      separator_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      separator_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      separator = {
        fg = "NONE",
        bg = "NONE",
      },
      indicator_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      pick_selected = {
        fg = "NONE",
        bg = "NONE",
      },
      pick_visible = {
        fg = "NONE",
        bg = "NONE",
      },
      pick = {
        fg = "NONE",
        bg = "NONE",
      },
    }
  end
end

bufferline.setup {
  options = {
    offsets = {
      { filetype = "NvimTree", text = "", padding = 1 },
      { filetype = "neo-tree", text = "", padding = 1 },
      { filetype = "Outline", text = "", padding = 1 },
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
  highlights = function()
    return refresh_ui()
  end,
}

vim.api.nvim_create_user_command("BufferLineRefreshUI", refresh_ui, {})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    refresh_ui()
  end,
})
