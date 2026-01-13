-- Claude-inspired colorscheme - warm, elegant, zen
return {
  -- Main colorscheme setup
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      on_colors = function(colors)
        -- Claude-inspired warm palette
        colors.bg = "#1C1917"           -- Warm dark (stone-900)
        colors.bg_dark = "#171412"      -- Deeper warm dark
        colors.bg_float = "#1C1917"
        colors.bg_popup = "#1C1917"
        colors.bg_sidebar = "#171412"
        colors.bg_statusline = "#171412"
        colors.bg_highlight = "#292524" -- stone-800
        colors.fg = "#E7E5E4"           -- Warm white (stone-200)
        colors.fg_dark = "#A8A29E"      -- stone-400
        colors.fg_gutter = "#57534E"    -- stone-600
        colors.comment = "#78716C"      -- stone-500
        colors.dark3 = "#44403C"        -- stone-700
        colors.dark5 = "#57534E"        -- stone-600
        colors.terminal_black = "#1C1917"

        -- Claude orange as the accent
        colors.orange = "#DA7756"       -- Claude's signature coral/orange
        colors.orange1 = "#DA7756"
        colors.yellow = "#F59E0B"       -- Amber
        colors.green = "#84CC16"        -- Lime
        colors.green1 = "#A3E635"
        colors.teal = "#2DD4BF"         -- Teal
        colors.cyan = "#22D3EE"         -- Cyan
        colors.blue = "#C4A574"         -- Warm tan (as blue replacement)
        colors.blue0 = "#B8976C"
        colors.blue1 = "#D4B896"
        colors.blue2 = "#C4A574"
        colors.blue5 = "#C4A574"
        colors.blue6 = "#D4B896"
        colors.blue7 = "#E8DDD4"
        colors.magenta = "#DA7756"      -- Use Claude orange
        colors.magenta2 = "#E8956A"
        colors.purple = "#C4A574"       -- Warm tan
        colors.red = "#EF4444"          -- Red for errors
        colors.red1 = "#F87171"

        -- Git colors
        colors.git = {
          add = "#84CC16",
          change = "#DA7756",
          delete = "#EF4444",
        }

        -- Diff colors
        colors.diff = {
          add = "#1a2e1a",
          change = "#2e2a1a",
          delete = "#2e1a1a",
          text = "#3d3a2a",
        }
      end,
      on_highlights = function(hl, c)
        -- Cursor and selection
        hl.CursorLine = { bg = "#292524" }
        hl.CursorLineNr = { fg = "#DA7756", bold = true }
        hl.Visual = { bg = "#44403C" }
        hl.VisualNOS = { bg = "#44403C" }

        -- Search
        hl.Search = { bg = "#DA7756", fg = "#1C1917" }
        hl.IncSearch = { bg = "#F59E0B", fg = "#1C1917" }
        hl.CurSearch = { bg = "#DA7756", fg = "#1C1917" }

        -- Matching parentheses
        hl.MatchParen = { bg = "#44403C", fg = "#DA7756", bold = true }

        -- Popup menu
        hl.Pmenu = { bg = "#292524", fg = "#E7E5E4" }
        hl.PmenuSel = { bg = "#DA7756", fg = "#1C1917" }
        hl.PmenuSbar = { bg = "#292524" }
        hl.PmenuThumb = { bg = "#DA7756" }

        -- Float windows
        hl.FloatBorder = { fg = "#DA7756", bg = "#1C1917" }
        hl.FloatTitle = { fg = "#DA7756", bg = "#1C1917", bold = true }

        -- Telescope
        hl.TelescopeBorder = { fg = "#DA7756", bg = "#1C1917" }
        hl.TelescopeTitle = { fg = "#DA7756", bold = true }
        hl.TelescopePromptBorder = { fg = "#DA7756", bg = "#1C1917" }
        hl.TelescopeResultsBorder = { fg = "#57534E", bg = "#1C1917" }
        hl.TelescopePreviewBorder = { fg = "#57534E", bg = "#1C1917" }
        hl.TelescopeSelection = { bg = "#292524", fg = "#E7E5E4" }
        hl.TelescopeSelectionCaret = { fg = "#DA7756" }

        -- Which-key
        hl.WhichKey = { fg = "#DA7756" }
        hl.WhichKeyGroup = { fg = "#C4A574" }
        hl.WhichKeyDesc = { fg = "#A8A29E" }
        hl.WhichKeySeparator = { fg = "#57534E" }
        hl.WhichKeyBorder = { fg = "#DA7756" }

        -- Indent guides
        hl.IndentBlanklineChar = { fg = "#292524" }
        hl.IndentBlanklineContextChar = { fg = "#DA7756" }
        hl.IblIndent = { fg = "#292524" }
        hl.IblScope = { fg = "#DA7756" }

        -- Git signs
        hl.GitSignsAdd = { fg = "#84CC16" }
        hl.GitSignsChange = { fg = "#DA7756" }
        hl.GitSignsDelete = { fg = "#EF4444" }

        -- Diagnostics
        hl.DiagnosticError = { fg = "#EF4444" }
        hl.DiagnosticWarn = { fg = "#F59E0B" }
        hl.DiagnosticInfo = { fg = "#DA7756" }
        hl.DiagnosticHint = { fg = "#C4A574" }

        -- LSP
        hl.LspReferenceText = { bg = "#292524" }
        hl.LspReferenceRead = { bg = "#292524" }
        hl.LspReferenceWrite = { bg = "#292524" }

        -- Treesitter highlights
        hl["@keyword"] = { fg = "#DA7756", italic = true }
        hl["@function"] = { fg = "#C4A574" }
        hl["@function.call"] = { fg = "#C4A574" }
        hl["@method"] = { fg = "#C4A574" }
        hl["@method.call"] = { fg = "#C4A574" }
        hl["@string"] = { fg = "#84CC16" }
        hl["@number"] = { fg = "#F59E0B" }
        hl["@boolean"] = { fg = "#DA7756" }
        hl["@variable"] = { fg = "#E7E5E4" }
        hl["@parameter"] = { fg = "#E8DDD4" }
        hl["@property"] = { fg = "#D4B896" }
        hl["@field"] = { fg = "#D4B896" }
        hl["@type"] = { fg = "#DA7756" }
        hl["@type.builtin"] = { fg = "#DA7756", italic = true }
        hl["@constant"] = { fg = "#F59E0B" }
        hl["@constant.builtin"] = { fg = "#F59E0B", italic = true }
        hl["@constructor"] = { fg = "#DA7756" }
        hl["@punctuation.bracket"] = { fg = "#A8A29E" }
        hl["@punctuation.delimiter"] = { fg = "#A8A29E" }
        hl["@operator"] = { fg = "#A8A29E" }
        hl["@tag"] = { fg = "#DA7756" }
        hl["@tag.attribute"] = { fg = "#C4A574", italic = true }
        hl["@tag.delimiter"] = { fg = "#A8A29E" }

        -- Noice
        hl.NoiceCmdlinePopupBorder = { fg = "#DA7756" }
        hl.NoiceCmdlineIcon = { fg = "#DA7756" }

        -- Notify
        hl.NotifyINFOBorder = { fg = "#DA7756" }
        hl.NotifyINFOIcon = { fg = "#DA7756" }
        hl.NotifyINFOTitle = { fg = "#DA7756" }

        -- Neo-tree
        hl.NeoTreeDirectoryIcon = { fg = "#DA7756" }
        hl.NeoTreeDirectoryName = { fg = "#C4A574" }
        hl.NeoTreeRootName = { fg = "#DA7756", bold = true }
        hl.NeoTreeGitModified = { fg = "#DA7756" }
        hl.NeoTreeGitAdded = { fg = "#84CC16" }
        hl.NeoTreeGitDeleted = { fg = "#EF4444" }

        -- Dashboard / Alpha
        hl.AlphaHeader = { fg = "#DA7756" }
        hl.AlphaButtons = { fg = "#C4A574" }
        hl.AlphaShortcut = { fg = "#DA7756" }
        hl.AlphaFooter = { fg = "#78716C", italic = true }

        -- Mini
        hl.MiniIndentscopeSymbol = { fg = "#DA7756" }
        hl.MiniCursorword = { bg = "#292524" }
        hl.MiniCursorwordCurrent = { bg = "#292524" }

        -- Bufferline / tabline
        hl.BufferLineIndicatorSelected = { fg = "#DA7756" }
        hl.BufferLineFill = { bg = "#171412" }

        -- Status line (lualine will be configured separately)
        hl.StatusLine = { bg = "#171412", fg = "#A8A29E" }
        hl.StatusLineNC = { bg = "#171412", fg = "#57534E" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
