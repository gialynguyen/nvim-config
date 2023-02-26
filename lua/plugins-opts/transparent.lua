require("transparent").setup {
  enable = true,
  extra_groups = {
    "BufferLineFill",
    "BufferLineBackground",

    "BufferLineTab",
    "BufferLineTabSelected",
    "BufferLineTabClose",
    "BufferLineTabSeparator",
    "BufferLineTabSelected",

    "BufferLineNumbers",

    "BufferLineDuplicate",

    "BufferLineDiagnostic",
    "BufferLineDiagnosticVisble",
    "BufferLineDiagnosticSelected",

    "BufferLineError",
    "BufferLineErrorVisible",
    "BufferLineErrorSelected",
    "BufferLineErrorDiagnostic",
    "BufferLineErrorDiagnosticSelected",
    "BufferLineErrorDiagnosticVisible",

    "BufferLineWarning",
    "BufferLineWarningVisible",
    "BufferLineWarningSelected",
    "BufferLineWarningDiagnostic",
    "BufferLineWarningDiagnosticSelected",
    "BufferLineWarningDiagnosticVisible",

    "BufferLineInfo",
    "BufferLineInfoVisible",
    "BufferLineInfoSelected",
    "BufferLineInfoDiagnostic",
    "BufferLineInfoDiagnosticSelected",
    "BufferLineInfoDiagnosticVisible",

    "BufferLineHint",
    "BufferLineHintVisible",
    "BufferLineHintSelected",
    "BufferLineHintDiagnostic",
    "BufferLineHintDiagnosticSelected",
    "BufferLineHintDiagnosticVisible",

    "BufferLineCloseButton",
    "BufferLineCloseButtonVisible",
    "BufferLineCloseButtonSelected",

    "BufferLineBuffer",
    "BufferLineBufferVisible",

    "BufferLineNumbers",
    "BufferLineNumbersVisible",
    "BufferLineNumbersSelected",

    "BufferLineModified",
    "BufferLineModifiedSelected",
    "BufferLineModifiedVisible",

    "BufferLineIndicator",
    "BufferLineIndicatorSelected",

    "BufferLineSeparator",
    "BufferLineSeparatorSelected",
    "BufferLineSeparatorVisible",
    "BufferLineOffsetSeparator",
    "BufferLineGroupSeparator",

    "BufferLineDuplicate",
    "BufferLineDuplicateVisible",
    "BufferLineDuplicateSelected",

    "toggleterm",
    "ZenBg",
    "MasonNormal",

    "NvimTreeNormal",
    "NvimTreeStatuslineNc",
    "NvimTreeEndOfBuffer",
  },
  exclude = {},
}

local transparent_enabled

local function init_transparent()
  if vim.g.transparent_enabled == transparent_enabled then
    return
  end

  if vim.g.transparent_enabled == true then
    vim.cmd "TransparentEnable"
  else
    vim.cmd "TransparentDisable"
  end

  transparent_enabled = vim.g.transparent_enabled
end

vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = init_transparent })
