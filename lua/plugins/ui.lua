-- UI enhancements
return {
  -- Horizon colorscheme
  {
    "akinsho/horizon.nvim",
    version = "*",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("horizon")
    end,
  },

  -- Disable bufferline (no tabs)
  { "akinsho/bufferline.nvim", enabled = false },

  -- Dashboard with Claude branding
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[

         ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗
        ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝
        ██║     ██║     ███████║██║   ██║██║  ██║█████╗
        ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝
        ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗
         ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝

                    ███╗   ██╗██╗   ██╗██╗███╗   ███╗
                    ████╗  ██║██║   ██║██║████╗ ████║
                    ██╔██╗ ██║██║   ██║██║██╔████╔██║
                    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
                    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
                    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

              ┌─────────────────────────────────────┐
              │   zen master 2026 AI maxxer mode   │
              └─────────────────────────────────────┘
      ]]

      logo = string.rep("\n", 2) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          center = {
            { action = "lua Snacks.picker.git_files()", desc = " Find file", icon = " ", key = "f" },
            { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
            { action = "lua Snacks.picker.recent()", desc = " Recent files", icon = " ", key = "r" },
            { action = "lua Snacks.picker.grep()", desc = " Find text", icon = " ", key = "g" },
            { action = [[lua LazyVim.pick.config_files()()]], desc = " Config", icon = " ", key = "c" },
            { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
            { action = "LazyExtras", desc = " Lazy Extras", icon = " ", key = "x" },
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
              "",
              "「 thinking... 」",
            }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },

  -- Minimal statusline - folder name + file path
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = true,
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_a = {
          {
            function()
              return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            end,
            color = { bg = "#DA7756", fg = "#1C1917", gui = "bold" },
            separator = { right = "" },
          },
        },
        lualine_b = {},
        lualine_c = { { "filename", path = 1, color = { fg = "#999999" } } },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  -- Disable winbar breadcrumbs
  { "utilyre/barbecue.nvim", enabled = false },

  -- Noice for nice command line UI
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline_popup",
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing_function = "sine",
      pre_hook = nil,
      post_hook = nil,
    },
  },

  -- Winbar breadcrumbs
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      theme = {
        normal = { bg = "#1C1917" },
        ellipsis = { fg = "#78716C" },
        separator = { fg = "#57534E" },
        dirname = { fg = "#78716C" },
        basename = { fg = "#DA7756", bold = true },
        context = { fg = "#A8A29E" },
      },
      show_modified = true,
      symbols = {
        modified = "●",
        ellipsis = "…",
        separator = "",
      },
    },
  },
}
