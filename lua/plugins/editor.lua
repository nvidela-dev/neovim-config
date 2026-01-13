-- Editor enhancements
return {
  -- Configure blink.cmp to respect toggle
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return vim.g.cmp_enabled ~= false
      end,
    },
  },

  -- Snacks config
  {
    "folke/snacks.nvim",
    opts = {
      explorer = { enabled = false },
      picker = {
        win = {
          input = {
            keys = {
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
    },
    init = function()
      -- Fix dark path colors in picker after colorscheme loads
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#999999" })
          vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = "#cccccc" })
          vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#888888" })
          vim.api.nvim_set_hl(0, "SnacksPickerPath", { fg = "#999999" })
        end,
      })
      -- Also set now in case colorscheme already loaded
      vim.api.nvim_set_hl(0, "SnacksPickerDir", { fg = "#999999" })
      vim.api.nvim_set_hl(0, "SnacksPickerFile", { fg = "#cccccc" })
      vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { fg = "#888888" })
      vim.api.nvim_set_hl(0, "SnacksPickerPath", { fg = "#999999" })
    end,
  },

  -- Better comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "VeryLazy",
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      colors = {
        error = { "#EF4444" },
        warning = { "#F59E0B" },
        info = { "#DA7756" },
        hint = { "#C4A574" },
        default = { "#78716C" },
        test = { "#84CC16" },
      },
    },
  },

  -- Flash for quick navigation
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",
      search = {
        mode = "fuzzy",
      },
      label = {
        uppercase = false,
        rainbow = {
          enabled = true,
          shade = 5,
        },
      },
      highlight = {
        backdrop = true,
        matches = true,
        priority = 5000,
        groups = {
          match = "FlashMatch",
          current = "FlashCurrent",
          backdrop = "FlashBackdrop",
          label = "FlashLabel",
        },
      },
      modes = {
        search = { enabled = false },
        char = { enabled = true },
        treesitter = { labels = "asdfghjklqwertyuiopzxcvbnm" },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  },

  -- Better quickfix
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        lsp = {
          win = { position = "right" },
        },
      },
    },
  },

  -- File explorer enhancements
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
          never_show = {},
        },
      },
      window = {
        position = "left",
        width = 35,
        mappings = {
          ["<space>"] = "none",
          ["Y"] = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
            vim.notify("Copied path to clipboard: " .. path)
          end,
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    },
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 500,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    },
  },

  -- Better search/replace
  {
    "nvim-pack/nvim-spectre",
    build = false,
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- Zen mode for focused coding
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        height = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = true },
      },
    },
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
    },
  },

  -- Twilight (dims inactive code)
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#78716C" },
        term_bg = "#1C1917",
        inactive = false,
      },
      context = 10,
      treesitter = true,
    },
  },

}
