local bufferline = require "bufferline"

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
  highlights = {
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
  },
}

vim.cmd [[
 autocmd ColorScheme * highlight BufferLineFill guibg=none
 autocmd ColorScheme * highlight BufferLineBackground guifg=none
 autocmd ColorScheme * highlight BufferLineBufferSelected guifg=none gui=none
 ]]
