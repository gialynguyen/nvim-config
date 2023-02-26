local function spread(template)
  local result = {}
  for key, value in pairs(template) do
    result[key] = value
  end

  return function(table)
    for key, value in pairs(table) do
      result[key] = value
    end
    return result
  end
end

local telescope = require "telescope"
local telescope_picker_opts = {
  theme = "ivy",
  layout_config = {
    preview_width = 0.4,
  },
}

telescope.setup {
  defaults = {
    mappings = { n = { ["o"] = require("telescope.actions").select_default } },
    initial_mode = "normal",
    hidden = false,
    color_devicons = true,
  },
  pickers = {
    find_files = spread(telescope_picker_opts) {},
    fd = spread(telescope_picker_opts) {},
    git_status = spread(telescope_picker_opts) {},
    git_files = spread(telescope_picker_opts) {},
    treesitter = spread(telescope_picker_opts) {},
    diagnostics = spread(telescope_picker_opts) {},
    oldfiles = spread(telescope_picker_opts) {},
    buffers = {
      theme = "dropdown",
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    live_grep_raw = {
      vimgrep_argument = {
        "rg",
      },
    },
  },
}

telescope.load_extension "fzf"
telescope.load_extension "ui-select"
telescope.load_extension "live_grep_args"
telescope.load_extension "file_browser"
