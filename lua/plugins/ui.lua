-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim

return {

  ----------------------------------------------------------------------------------------
  -- noice ui
  ----------------------------------------------------------------------------------------
  {
    "folke/noice.nvim",
    opts = function(_, opts)
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
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")
      local colors = {
        [""] = Util.ui.fg("Special"),
        ["Normal"] = Util.ui.fg("Special"),
        ["Warning"] = Util.ui.fg("DiagnosticError"),
        ["InProgress"] = Util.ui.fg("DiagnosticWarn"),
      }

      return {
        options = {
          theme = "auto",
          -- background_colour = "transparent",
          component_separators = { left = "", right = "" },
          -- section_separators = { left = "", right = "" },
          section_separators = { left = "█", right = "█" },
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          -- lualine_a = { { "mode", separator = { left = "", right = "" }, padding = 1 } },
          lualine_a = { { "mode", separator = { left = "", right = "" }, padding = 1 } },
          lualine_b = {
            {
              "filetype",
              icon_only = true,
              separator = "",
              padding = {
                left = 1,
                right = 0,
              },
            },
            { "filename", path = 1, symbols = { modified = "🖹", readonly = " 🛇 ", unnamed = "" } },
          },
          lualine_c = {
            "branch",
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            -- stylua: ignore
            {
              function() return require("nvim-navic").get_location() end,
              cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            },
          },
          lualine_x = {
            -- stylua: ignore
            {
                function() return require("noice").api.status.command.get() end,
                cond = function()
                    return package.loaded["noice"] and
                        require("noice").api.status.command.has()
                end,
                color = Util.ui.fg("Statement")
            },
            -- stylua: ignore
            {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                color = Util.ui.fg("Constant"),
            },
            -- stylua: ignore
            -- {
            --   function()
            --     return "  " .. require("dap").status()
            --   end,
            --   cond = function()
            --     return package.loaded["dap"] and require("dap").status() ~= ""
            --   end,
            --   color = Util.ui.fg("Debug"),
            -- },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = Util.ui.fg("Special"),
            },

            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
            -- copilot icon
            {
              function()
                local icon = icons.kinds.Copilot
                local status = require("copilot.api").status.data
                return icon .. (status.message or "")
              end,
              cond = function()
                if not package.loaded["copilot"] then
                  return
                end
                local ok, clients = pcall(require("lazyvim.util").lsp.get_clients, { name = "copilot", bufnr = 0 })
                if not ok then
                  return false
                end
                return ok and #clients > 0
              end,
              color = function()
                if not package.loaded["copilot"] then
                  return
                end
                local status = require("copilot.api").status.data
                return colors[status.status] or colors[""]
              end,
            },
          },
          lualine_y = {
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            -- { "progress", separator = { left = "", right = "" }, padding = { left = 1, right = 0 } },
            { "progress", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
            -- function()
            --   return " " .. os.date("%R")
            -- end,
          },
        },
        extensions = { "neo-tree", "lazy" },
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
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
      { "<S-h>", false },
      { "<S-l>", false },
      { "[b", false },
      { "]b", false },
    },
    opts = {
      options = {
      -- stylua: ignore
      close_command = function(n) require("mini.bufremove").delete(n, false) end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require("lazyvim.config").icons.diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  ----------------------------------------------------------------------------------------
  -- nvim navic (for representing in which code block you're in right now)
  ----------------------------------------------------------------------------------------
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    init = function()
      vim.g.navic_silence = true
      require("lazyvim.util").lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
    opts = function()
      return {
        separator = " ",
        highlight = true,
        depth_limit = 5,
        icons = require("lazyvim.config").icons.kinds,
        lazy_update_context = true,
      }
    end,
  },
}
