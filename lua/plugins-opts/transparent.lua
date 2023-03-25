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

    -- -- general
    -- "TitleString",
    -- "TitleIcon",
    -- "SagaBorder",
    -- "SagaNormal",
    -- "SagaExpand",
    -- "SagaCollapse",
    -- "SagaCount",
    -- "SagaBeacon",
    -- -- code action
    -- "ActionPreviewNormal",
    -- "ActionPreviewBorder",
    -- "ActionPreviewTitle",
    -- "CodeActionNormal",
    -- "CodeActionBorder",
    -- "CodeActionText",
    -- "CodeActionNumber",
    -- -- finder
    -- "FinderSelection",
    -- "FinderFileName",
    -- "FinderCount",
    -- "FinderIcon",
    -- "FinderType",
    -- --finder spinner
    -- "FinderSpinnerTitle",
    -- "FinderSpinner",
    -- "FinderPreviewSearch",
    -- "FinderVirtText",
    -- "FinderNormal",
    -- "FinderBorder",
    -- "FinderPreviewBorder",
    -- -- definition
    -- "DefinitionBorder",
    -- "DefinitionNormal",
    -- "DefinitionSearch",
    -- -- hover
    -- "HoverNormal",
    -- "HoverBorder",
    -- -- rename
    -- "RenameBorder",
    -- "RenameNormal",
    -- "RenameMatch",
    -- -- diagnostic
    -- "DiagnosticBorder",
    -- "DiagnosticSource",
    -- "DiagnosticNormal",
    -- "DiagnosticPos",
    -- "DiagnosticWord",
    -- "DiagnosticHead",
    -- -- Call Hierachry
    -- "CallHierarchyNormal",
    -- "CallHierarchyBorder",
    -- "CallHierarchyIcon",
    -- "CallHierarchyTitle",
    -- -- lightbulb
    -- "SagaLightBulb",
    -- -- shadow
    -- "SagaShadow",
    -- -- Outline
    -- "OutlineIndent",
    -- "OutlinePreviewBorder",
    -- "OutlinePreviewNormal",
    -- -- Float term
    -- "TerminalBorder",
    -- "TerminalNormal",
  },
  exclude_groups = {},
}
