vim.g.transparent_enabled = true

require("transparent").setup {
  groups = { -- table: default groups
    "Normal",
    "NormalNC",
    "Comment",
    "Constant",
    "Special",
    "Identifier",
    "Statement",
    "PreProc",
    "Type",
    "Underlined",
    "Todo",
    "String",
    "Function",
    "Conditional",
    "Repeat",
    "Operator",
    "Structure",
    "LineNr",
    "NonText",
    "SignColumn",
    "CursorLineNr",
    "EndOfBuffer",
  },
  extra_groups = {
    "VertSplit",
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
    "NvimTreeWinSeparator",
    "NvimTreeStatuslineNc",
    "NvimTreeEndOfBuffer",

    "TerminalBorder",
    "TerminalNormal",
    "FloatermBorder",
    "Floaterm",

    "LspFloatWinNormal",
    "Normal",
    "NormalFloat",
    "FloatBorder",
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptBorder",
    "SagaBorder",
    "SagaNormal",
  },
  exclude_groups = {},
}
