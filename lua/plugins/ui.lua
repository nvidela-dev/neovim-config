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

  -- Lualine with Claude colors
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      local colors = {
        bg = "#171412",
        fg = "#E7E5E4",
        orange = "#DA7756",
        tan = "#C4A574",
        stone = "#78716C",
        green = "#84CC16",
        red = "#EF4444",
        yellow = "#F59E0B",
      }

      local claude_theme = {
        normal = {
          a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
          b = { bg = "#292524", fg = colors.fg },
          c = { bg = colors.bg, fg = colors.stone },
        },
        insert = {
          a = { bg = colors.green, fg = colors.bg, gui = "bold" },
          b = { bg = "#292524", fg = colors.fg },
          c = { bg = colors.bg, fg = colors.stone },
        },
        visual = {
          a = { bg = colors.tan, fg = colors.bg, gui = "bold" },
          b = { bg = "#292524", fg = colors.fg },
          c = { bg = colors.bg, fg = colors.stone },
        },
        replace = {
          a = { bg = colors.red, fg = colors.bg, gui = "bold" },
          b = { bg = "#292524", fg = colors.fg },
          c = { bg = colors.bg, fg = colors.stone },
        },
        command = {
          a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
          b = { bg = "#292524", fg = colors.fg },
          c = { bg = colors.bg, fg = colors.stone },
        },
        inactive = {
          a = { bg = colors.bg, fg = colors.stone },
          b = { bg = colors.bg, fg = colors.stone },
          c = { bg = colors.bg, fg = colors.stone },
        },
      }

      return {
        options = {
          theme = claude_theme,
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
          component_separators = { left = "│", right = "│" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return str:sub(1, 1)
              end,
            },
          },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = " ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { "filename", path = 1 },
          },
          lualine_x = {
            {
              function()
                return require("noice").api.status.command.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.command.has()
              end,
              color = { fg = colors.tan },
            },
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = { fg = colors.orange },
            },
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = { fg = colors.orange },
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = colors.orange },
            },
            {
              "diff",
              symbols = {
                added = " ",
                modified = " ",
                removed = " ",
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              function()
                return " " .. os.date("%H:%M")
              end,
            },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },

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
