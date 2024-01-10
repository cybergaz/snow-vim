return {
  ----------------------------------------------------------------------------------------------------------------------------
  -- neo tree annoying keymaps disabled
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        { "<leader>ee", "<cmd>Neotree float<cr>", desc = "neo tree float" },
      }
    end,
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- nvim-cmp - overrdding default tab button action
  ----------------------------------------------------------------------------------------------------------------------------
  {
    -- this luasnip block is necessary to work with TAB and to disable nvim-cmp irritating TAB warps (up until this version)
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#18202b" })
      vim.api.nvim_set_hl(0, "BorderBG", { bg = "#035B78" })
      vim.api.nvim_set_hl(0, "CursorLineSel", { bg = "#4B4F5C" })
      vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = "#0C1219" })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
          completion = {
            -- border = "rounded",
            winhighlight = "Normal:CmpNormal,FloatBorder:BorderBG,CursorLine:CursorLineSel",
            -- side_padding = 0,
          },
          documentation = {
            winhighlight = "Normal:CmpDocNormal",
          },
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-CR>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
      }
    end,
    ---@param opts cmp.ConfigSchema
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      require("cmp").setup(opts)
    end,
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- telescope fixation
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
      { "<leader>:", false },
      { "<leader><space>", false },
      { "<leader>fb", false },
      { "<leader>fr", false },
      { "<leader>gc", false },
      { "<leader>gs", false },
      { "<leader>sa", false },
      { "<leader>sb", false },
      { "<leader>sb", false },
      { "<leader>sc", false },
      { "<leader>sC", false },
      { "<leader>sd", false },
      { "<leader>sg", false },
      { "<leader>sG", false },
      { "<leader>sh", false },
      { "<leader>sH", false },
      { "<leader>sk", false },
      { "<leader>sM", false },
      { "<leader>sm", false },
      { "<leader>so", false },
      { "<leader>sR", false },
      { "<leader>sw", false },
      { "<leader>sW", false },
      { "<leader>uC", false },
      { "<leader>ss", false },
      { "<leader>sS", false },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "marks" },
    },
    require("telescope").setup({
      extensions = {
        file_browser = {
          -- theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {},
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }),
    -- require("telescope").load_extension("file_browser"),
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- notify plugin screaming stop
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
    },
    -- require("notify").setup({
    --   background_colour = "#000000",
    -- }),
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- lualine restructured
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("lazyvim.config").icons
      local Util = require("lazyvim.util")

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

  ----------------------------------------------------------------------------------------------------------------------------
  -- alpha nvim ( logo )
  ----------------------------------------------------------------------------------------------------------------------------
  --   {
  --     "goolord/alpha-nvim",
  --     event = "VimEnter",
  --     opts = function()
  --       local dashboard = require("alpha.themes.dashboard")
  --       local logo = [[
  -- ________                        ___    ______
  -- __  ___/_______________      __ __ |  / /__(_)______ ___
  -- _____ \__  __ \  __ \_ | /| / / __ | / /__  /__  __ `__ \
  -- ____/ /_  / / / /_/ /_ |/ |/ /  __ |/ / _  / _  / / / / /
  -- /____/ /_/ /_/\____/____/|__/   _____/  /_/  /_/ /_/ /_/
  --       ]]
  --       dashboard.section.header.val = vim.split(logo, "\n")
  --     end,
  --   },

  ----------------------------------------------------------------------------------------------------------------------------
  -- dashboard
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
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

  ----------------------------------------------------------------------------------------------------------------------------
  -- bufferline
  ----------------------------------------------------------------------------------------------------------------------------

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

  ----------------------------------------------------------------------------------------------------------------------------
  -- noice ui
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- for borders around pop-ups
      opts.presets.lsp_doc_border = true
      opts.presets.bottom_search = false
    end,
  },
}
