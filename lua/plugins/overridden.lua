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
  -- overrdding default tab button action
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      -- cmp.setup({
      --   window = {
      --     completion = cmp.config.window.bordered(),
      --     -- documentation = cmp.config.window.bordered(),
      --     -- documentation = cmp.config.disable,
      --   },
      -- })
    end,
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- tokyonight theme management
  ----------------------------------------------------------------------------------------------------------------------------
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },

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
      { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    },
    require("telescope").setup({
      extensions = {
        file_browser = {
          -- theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              -- your custom insert mode mappings
            },
            ["n"] = {
              -- your custom normal mode mappings
            },
          },
        },
      },
    }),
    require("telescope").load_extension("file_browser"),
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- notify plugin screaming stop
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
    },
    require("notify").setup({
      background_colour = "#000000",
    }),
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- lualine restructured
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(plugin)
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          -- background_colour = "#000000",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
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
            { "filename", path = 0, symbols = { modified = "  ", readonly = "", unnamed = "" } },
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
            -- {
            --   function() return require("nvim-navic").get_location() end,
            --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
          },
          lualine_x = {
                        -- stylua: ignore
                        {
                            function() return require("noice").api.status.command.get() end,
                            cond = function()
                                return package.loaded["noice"] and
                                    require("noice").api.status.command.has()
                            end,
                            color = fg("Statement")
                        },
                        -- stylua: ignore
                        {
                            function() return require("noice").api.status.mode.get() end,
                            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                            color = fg("Constant"),
                        },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = fg("Special"),
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
            -- { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            { "progress", separator = " ", padding = { left = 1, right = 1 } },
            -- function()
            --   return " " .. os.date("%R")
            -- end,
          },
        },
        extensions = { "neo-tree" },
      }
    end,
  },

  ----------------------------------------------------------------------------------------------------------------------------
  -- alpha nvim ( logo )
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                                                    _
                                                   (_)
     .--.   _ .--.   .--.   _   _   __     _   __  __   _ .--..--.
    ( (`\] [ `.-. |/ .'`\ \[ \ [ \ [  ]   [ \ [  ][  | [ `.-. .-. |
     `'.'.  | | | || \__. | \ \/\ \/ /     \ \/ /  | |  | | | | | |
    [\__) )[___||__]'.__.'   \__/\__/       \__/  [___][___||__||__]
      ]]
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },

  ----------------------------------------------------------------------------------------------------------------------------
  --  material theme setup
  ----------------------------------------------------------------------------------------------------------------------------
  {
    "marko-cerovac/material.nvim",
    init = function()
      vim.g.material_style = "deep ocean"
    end,
    config = function()
      vim.cmd("colorscheme material")
    end,
    require("material").setup({
      contrast = {
        terminal = false, -- Enable contrast for the built-in terminal
        sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
        floating_windows = true, -- Enable contrast for floating windows
        cursor_line = true, -- Enable darker background for the cursor line
        non_current_windows = false, -- Enable darker background for non-current windows
        filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
      },
      styles = {
        -- Give comments style such as bold, italic, underline etc.
        comments = { italic = true },
        strings = { --[[ bold = true ]]
        },
        keywords = { --[[ underline = true ]]
        },
        functions = {
          bold = true, --[[, undercurl = true ]]
        },
        variables = {},
        operators = {},
        types = {},
      },
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        -- "dap",
        -- "dashboard",
        -- "gitsigns",
        -- "hop",
        -- "indent-blankline",
        -- "lspsaga",
        -- "mini",
        -- "neogit",
        -- "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-tree",
        -- "nvim-web-devicons",
        -- "sneak",
        -- "telescope",
        -- "trouble",
        -- "which-key",
      },
      disable = {
        colored_cursor = true, -- Disable the colored cursor
        borders = false, -- Disable borders between verticaly split windows
        background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
        term_colors = false, -- Prevent the theme from setting terminal colors
        eob_lines = false, -- Hide the end-of-buffer lines
      },
      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true, -- Enable higher contrast text for darker style
      },
      lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
      async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
      --
      -- To see the available colors, locate lua/material/colors/init.lua
      --
      custom_colors = function(colors)
        -- colors.editor.bg = "#0F111A"
        -- colors.editor.bg_alt       = "#090B10"
        -- colors.editor.fg           = "#A6ACCD"
        colors.editor.selection = "#355586"
        colors.syntax.comments = "#464B5D"
        colors.editor.contrast = "#090B10"
        colors.editor.active = "#1A1C25"
        colors.editor.border = "#232637"
        colors.editor.line_numbers = "#3B3F51"
        colors.editor.highlight = "#1F2233"
        colors.editor.disabled = "#464B5D"
        colors.editor.accent = "#246AF3"

        colors.syntax.string = "#00FFA3"
        colors.syntax.variable = colors.editor.fg
        colors.syntax.field = colors.editor.fg
        colors.syntax.keyword = "#F7525F"
        colors.syntax.value = "#F06B57"
        colors.syntax.operator = "#e32283"
        colors.syntax.type = "#09b3a4"
        colors.syntax.fn = "#4ae8db"

        colors.main.blue = "#1169F1"
        colors.main.cyan = "#4B9BE5"
        colors.main.green = "#00FFA3"
        colors.main.yellow = "#31AFCD"
        colors.main.red = "#E53935"
        colors.main.paleblue = "#8796B0"
        colors.main.purple = "#464B5D"
        colors.main.orange = "#F76D47"
        colors.main.pink = "#FF5370"

        ---git colors
        colors.git.added = colors.main.green
        colors.git.removed = colors.main.red
        colors.git.modified = colors.main.blue

        ---lsp colors
        colors.lsp.warning = colors.main.yellow
        colors.lsp.info = colors.main.paleblue
        colors.lsp.hint = colors.main.purple

        ---contrasted backgrounds
        -- colors.backgrounds.sidebars = colors.editor.bg
        -- colors.backgrounds.floating_windows = colors.editor.bg
        -- colors.backgrounds.non_current_windows = colors.editor.bg
        -- colors.backgrounds.cursor_line = colors.editor.active
      end,
      custom_highlights = {
        -- LineNr = { bg = "#FF0001" },
        -- CursorLine = { fg = "#ffffff", underline = true },

        -- This is a list of possible values
        -- YourHighlightGroup = {
        --     fg = "#SOME_COLOR", -- foreground color
        --     bg = "#SOME_COLOR", -- background color
        --     sp = "#SOME_COLOR", -- special color (for colored underlines, undercurls...)
        --     bold = false, -- make group bold
        --     italic = false, -- make group italic
        --     underline = false, -- make group underlined
        --     undercurl = false, -- make group undercurled
        --     underdot = false, -- make group underdotted
        --     underdash = false, -- make group underslashed
        --     striketrough = false, -- make group striked trough
        --     reverse = false, -- reverse the fg and bg colors
        --     link = "SomeOtherGroup" -- link to some other highlight group
        -- }
      }, -- Overwrite highlights with your own
    }),
  },
}
