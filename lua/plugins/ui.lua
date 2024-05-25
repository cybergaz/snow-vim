-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim

return {

  ----------------------------------------------------------------------------------------
  -- noice ui
  ----------------------------------------------------------------------------------------
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      -- for borders around pop-ups
      opts.presets.lsp_doc_border = true
      opts.presets.bottom_search = false
    end,
  },

  ----------------------------------------------------------------------------------------
  -- notify plugin screaming stop
  ----------------------------------------------------------------------------------------
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
    },
    -- require("notify").setup({
    --   background_colour = "#000000",
    -- }),
  },

  ----------------------------------------------------------------------------------------
  -- lualine restructured
  ----------------------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local colors = {
        grey = "#7b8496",
        green = "#5eff6c",
        blue = "#5ea1ff",
        cyan = "#5ef1ff",
        red = "#ff6e5e",
        magenta = "#ff5ef1",
        yellow = "#f1ff5e",
        none = "NONE",
      }
      local copilot_colors = {
        [""] = { fg = colors.grey, bg = colors.none },
        ["Normal"] = { fg = colors.grey, bg = colors.none },
        ["Warning"] = { fg = colors.red, bg = colors.none },
        ["InProgress"] = { fg = colors.yellow, bg = colors.none },
      }
      return {
        options = {
          -- separators = { left = "","","","█"  right = "","","","█" },
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = {
            { "mode", icon = "" },
            -- icon = ""
          },
          lualine_b = {
            { "branch", icon = "", padding = { left = 2, right = 1 }, color = { fg = "#1abc9c" } },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              "filename",
              path = 1,
              symbols = { modified = "🖉", readonly = "🛇", unnamed = "" },
              padding = { left = 0, right = 1 },
              -- color = { fg = "#FFFFFF" },
            },
          },
          lualine_c = {
            -- "%=",
            -- {
            --   function()
            --     return require("nvim-navic").get_location()
            --   end,
            --   cond = function()
            --     return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
            --   end,
            --   color = { fg = colors.grey, bg = colors.none },
            -- },
          },
          lualine_x = {
            -- status (like macro recording etc)
            {
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = { fg = colors.blue, bg = colors.none },
            },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = colors.green },
            },
            -- copilot icon
            {
              function()
                local icon = " "
                local status = require("copilot.api").status.data
                return icon .. (status.message or "")
              end,
              cond = function()
                local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
                return ok and #clients > 0
              end,
              color = function()
                if not package.loaded["copilot"] then
                  return
                end
                local status = require("copilot.api").status.data
                return copilot_colors[status.status] or copilot_colors[""]
              end,
            },
          },
          lualine_y = {
            { "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = "󰝶 " } },
            { "diff" },
          },
          lualine_z = {
            { "location", color = { fg = colors.blue, bg = colors.none } },
            { "progress" },
            -- function()
            --   return "  " .. os.date("%X")
            -- end,
          },
        },

        extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
      }
    end,
  },

  ----------------------------------------------------------------------------------------
  -- dashboard
  ----------------------------------------------------------------------------------------
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      --       local logo = [[
      -- ________                        ___    ______
      -- __  ___/_______________      __ __ |  / /__(_)______ ___
      -- _____ \__  __ \  __ \_ | /| / / __ | / /__  /__  __ `__ \
      -- ____/ /_  / / / /_/ /_ |/ |/ /  __ |/ / _  / _  / / / / /
      -- /____/ /_/ /_/\____/____/|__/   _____/  /_/  /_/ /_/ /_/
      --       ]]
      local logo = [[
 ,---.                               ,--.   ,--.,--.          
'   .-' ,--,--,  ,---. ,--.   ,--.    \  `.'  / `--',--,--,--.
`.  `-. |      \| .-. ||  |.'.|  |     \     /  ,--.|        |
.-'    ||  ||  |' '-' '|   .'.   |      \   /   |  ||  |  |  |
`-----' `--''--' `---' '--'   '--'       `-'    `--'`--`--`--'
    ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
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

  ----------------------------------------------------------------------------------------
  -- bufferline
  ----------------------------------------------------------------------------------------

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
      { "<S-h>", false },
      { "<S-l>", false },
      { "[b", false },
      { "]b", false },
    },
    opts = {
      options = {
        indicator = { style = "none" },
        buffer_close_icon = "",
        separator_style = { "", "" },
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            text_align = "center",
          },
        },
      },
    },
  },

  ----------------------------------------------------------------------------------------
  -- nvim navic (for representing in which code block you're rn)
  ----------------------------------------------------------------------------------------
  -- {
  --   "SmiteshP/nvim-navic",
  --   lazy = true,
  --   init = function()
  --     vim.g.navic_silence = true
  --     require("lazyvim.util").lsp.on_attach(function(client, buffer)
  --       if client.supports_method("textDocument/documentSymbol") then
  --         require("nvim-navic").attach(client, buffer)
  --       end
  --     end)
  --   end,
  --   opts = function()
  --     return {
  --       separator = " 󰁔 ",
  --       highlight = true,
  --       depth_limit = 4,
  --       icons = require("lazyvim.config").icons.kinds,
  --       lazy_update_context = true,
  --     }
  --   end,
  -- },

  ----------------------------------------------------------------------------------------
  -- animated indentscope line
  ----------------------------------------------------------------------------------------
  -- {
  --   {
  --     "echasnovski/mini.indentscope",
  --     version = false,
  --
  --     config = function()
  --       require("mini.indentscope").setup({
  --         {
  --           -- Draw options
  --           draw = {
  --             -- Delay (in ms) between event and start of drawing scope indicator
  --             delay = 100,
  --
  --             priority = 2,
  --           },
  --           -- Options which control scope computation
  --           options = {
  --             -- Type of scope's border: which line(s) with smaller indent to
  --             -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
  --             border = "none",
  --
  --             -- Whether to use cursor column when computing reference indent.
  --             -- Useful to see incremental scopes with horizontal cursor movements.
  --             indent_at_cursor = true,
  --
  --             -- Whether to first check input line to be a border of adjacent scope.
  --             -- Use it if you want to place cursor on function header to get scope of
  --             -- its body.
  --             try_as_border = false,
  --           },
  --
  --           -- Which character to use for drawing scope indicator
  --           symbol = "╎",
  --         },
  --       })
  --     end,
  --   },
  -- },
}
