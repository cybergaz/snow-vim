return {

  ----------------------------------------------------------------------------------------
  -- Configure LazyVim to load this theme
  ----------------------------------------------------------------------------------------
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },

  ----------------------------------------------------------------------------------------
  -- cyberdream theme configuration
  ----------------------------------------------------------------------------------------
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- local util = require("cyberdream.util")
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = false,
        borderless_telescope = false,
        terminal_colors = true,
        theme = {
          -- Override a color entirely
          colors = {
            -- For a list of colors see `lua/cyberdream/colours.lua`
            -- Example:
            bg = "#000000",
            fg = "#edf1f5",
            bgAlt = "#1e2124",
            bgHighlight = "#3c4048",
            -- grey = "#7b8496",
            grey = "#292E3D",
            blue = "#5ea1ff",
            green = "#07de88",
            cyan = "#5ef1ff",
            red = "#ff5370",
            yellow = "#f1ff5e",
            -- magenta = "#ff5ef1",
            magenta = "#bd5eff",
            -- pink = "#ff5ea0",
            pink = "#d95289",
            orange = "#ff9e64",
            purple = "#bd5eff",
          },
          highlights = {
            -- See `:help highlight-groups` for a list of highlight groupsui
            -- Complete list can be found in `lua/cyberdream/theme.lua`
            Comment = { fg = "#60606f", italic = true },
            boolean = { fg = "#E32283" },
            Constant = { fg = "#5e24f0", italic = true },
            Identifier = { fg = "#bec8d6" },
            Delimiter = { fg = "#30defc" }, -- for braces , colons and commas....
            -- Variable = { fg = "" },
            -- string = { fg = "" },
            -- Character = { fg = "", },
            number = { fg = "#E32283" },
            Keyword = { fg = "#a252d9" },
            -- namespace = { fg = "" },
            Operator = { fg = "#d95289" },
            Function = { fg = "#5ea1ff", italic = false },
            -- Hlargs = { fg = "", },
            Type = { fg = "#099e93" },
            LineNr = { fg = "#3d414f" },
            CursorLineNr = { fg = "#7b8496" },
            CursorLine = { bg = "" },
            Title = { bold = true, fg = "#00f0ac" },
            Visual = { bg = "#2d3345" },
            -- FloatNormal = { bg = "", fg = "" },
            FloatBorder = { bg = "", fg = "#50505e" },
            -- NormalFloat = { bg = "", fg = "" },
            FloatTitle = { bg = "", fg = "#5ea1ff" },
            IncSearch = { bg = "#f0f0f0", fg = "#1d202f" },
            Search = { bg = "#70707f", fg = "#f2f2ff" },
            MatchParen = { bold = true, fg = "#ff5ea0", bg = "" },
            Special = { fg = "#30defc" },
            WinSeparator = { fg = "#50505e", bg = "" },

            -- LSP & Diagnostics
            DiagnosticError = { fg = "#ff5370" },
            DiagnosticWarn = { fg = "#30a0c0" },
            DiagnosticInfo = { fg = "#5ea1ff" },
            DiagnosticHint = { fg = "#1abc9c" },
            DiagnosticUnnecessary = { fg = "#3d414f" },
            --
            DiagnosticVirtualTextError = { bg = "", fg = "#ff5370" },
            DiagnosticVirtualTextWarn = { bg = "", fg = "#30a0c0" },
            DiagnosticVirtualTextInfo = { bg = "", fg = "#0db9d7" },
            DiagnosticVirtualTextHint = { bg = "", fg = "#1abc9c" },
            --
            DiagnosticUnderlineError = { undercurl = true, sp = "#ff5370" },
            DiagnosticUnderlineWarn = { undercurl = true, sp = "#30a0c0" },
            DiagnosticUnderlineInfo = { undercurl = true, sp = "#0db9d7" },
            DiagnosticUnderlineHint = { undercurl = true, sp = "#1abc9c" },
            --
            LspSignatureActiveParameter = { fg = "" },
            LspCodeLens = { fg = "" },
            LspInlayHint = { fg = "#50505e" },
            LspInfoBorder = { fg = "#50505e" },
            LspReferenceText = { bg = "", underline = true },
            LspReferenceWrite = { bg = "", underline = true },
            LspReferenceRead = { bg = "", underline = true },

            -- Telescope
            TelescopeNormal = { bg = "" },
            TelescopeBorder = { fg = "#50505e", bg = "" },
            TelescopePreviewBorder = { fg = "", bg = "" },
            TelescopePreviewNormal = { bg = "" },
            TelescopePreviewTitle = { fg = "#5EA1FF", bg = "" },
            TelescopePromptNormal = { bg = "" },
            TelescopePromptBorder = { bg = "", fg = "" },
            TelescopePromptTitle = { bg = "", fg = "#5EA1FF" },
            TelescopePromptPrefix = { fg = "#5EA1ff", bg = "" },
            TelescopeResultsBorder = { fg = "", bg = "" },
            TelescopeResultsNormal = { bg = "" },
            TelescopeResultsTitle = { fg = "#5EA1ff", bg = "" },

            -- nvim-cmp completion menu
            CmpGhostText = { link = "Comment", default = true },
            CmpNormal = { bg = "#18202b" },
            BorderBG = { bg = "" },
            CursorLineSel = { bg = "#4B4F5C" },
            CmpDocNormal = { bg = "#0C1219" },
            CmpItemAbbrMatch = { fg = "#5EA1ff", bg = "" },
            CmpItemAbbrMatchFuzzy = { fg = "#5EA1ff", bg = "" },

            -- WhichKey
            WhichKey = { fg = "#5EA1FF" },
            WhichKeyGroup = { fg = "#5EA1FF" },
            WhichKeyDesc = { fg = "#d1dbe8" },
            WhichKeySeperator = { fg = "" },
            WhichKeyFloat = { bg = "" },
            WhichKeyValue = { fg = "" },

            -- GitSigns
            GitSignsAdd = { fg = "#1abc9c" },
            GitSignsChange = { fg = "#51A0CF" },
            GitSignsDelete = { fg = "#ff5370" },

            -- Indent Blankline
            IblIndent = { fg = "#292E3D" },
            IblScope = { fg = "#30defc" },

            -- dashboard-nvim
            DashboardHeader = { fg = "#bd5eff" },
            DashboardFooter = { fg = "#5ef1ff" },
            -- dashboard-nvim: doom theme
            DashboardShortCut = { fg = "" },
            DashboardDesc = { fg = "#5ea1ff" },
            DashboardKey = { fg = "#07de88" },
            DashboardIcon = { fg = "" },

            -- Noice
            NoiceFormatProgressDone = { fg = "#1e2124", bg = "#5ef1ff" },
            NoiceFormatProgressTodo = { fg = "#292e3d", bg = "#0C1219" },
            NoiceLspProgressClient = { fg = "#5ea1ff" },
            NoiceLspProgressSpinner = { fg = "#0afa9a" },
            NoiceLspProgressTitle = { fg = "#5ef1ff" },
            NoiceCmdlinePopupBorder = { fg = "#50505e" },
            NoiceCmdlinePopupBorderSearch = { fg = "#50505e" },
            -- NoiceCmdlinePopup = { fg = "" },

            -- Nvim Notify
            -- NotifyDEBUGBody = { fg = "#edf1f5" },
            -- NotifyDEBUGBorder = { fg = "#50505e" },
            -- NotifyDEBUGIcon = { fg = "#07DE88" },
            -- NotifyDEBUGTitle = { fg = "#5ef1ff" },
            -- NotifyERRORBody = { fg = "#edf1f5" },
            -- NotifyERRORBorder = { fg = "#50505e" },
            -- NotifyERRORIcon = { fg = "#07DE88" },
            -- NotifyERRORTitle = { fg = "#5ef1ff" },
            -- NotifyINFOBody = { fg = "#edf1f5" },
            -- NotifyINFOBorder = { fg = "#50505e" },
            -- NotifyINFOIcon = { fg = "#07DE88" },
            -- NotifyINFOTitle = { fg = "#5ef1ff" },
            -- NotifyTRACEBody = { fg = "#edf1f5" },
            -- NotifyTRACEBorder = { fg = "#50505e" },
            -- NotifyTRACEIcon = { fg = "#07DE88" },
            -- NotifyTRACETitle = { fg = "#5ef1ff" },
            -- NotifyWARNBody = { fg = "#edf1f5" },
            -- NotifyWARNBorder = { fg = "#50505e" },
            -- NotifyWARNIcon = { fg = "#07DE88" },
            -- NotifyWARNTitle = { fg = "#5ef1ff" },
            -- NotifyBackground = { bg = "" },
          },
        },
      })
      -- vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  },

  ----------------------------------------------------------------------------------------
  -- tokyonight theme configuration
  ----------------------------------------------------------------------------------------
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",

      transparent = true,

      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        functions = { bold = true },
        variables = {},
        sidebars = "transparent",
        floats = "transparent",
      },
      hide_inactive_statusline = false,
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      -- -----------------------------------------------------------------------------------
      on_colors = function(colors)
        -- colors.bg = "#24283b"
        -- colors.bg_dark = "#1f2335"
        -- colors.bg_float = "#1f2335"
        -- colors.bg_highlight = "#292e42"
        -- colors.bg_popup = "#1f2335"
        -- colors.bg_search = "#89ddff"
        -- colors.bg_sidebar = "#1f2335"
        -- colors.fg = "#c0caf5"
        -- colors.fg_dark = "#a9b1d6"
        -- colors.fg_float = "#c0caf5"
        -- colors.fg_gutter = "#3b4261"
        -- colors.fg_sidebar = "#a9b1d6"
        colors.bg_statusline = ""
        colors.border = "#1d202f"
        colors.border_highlight = "#29a4bd"
        colors.error = "#ff5370"
        colors.warning = "#ff9e64"

        colors.hint = "#1abc9c"
        colors.info = "#0db9d7"
        -- colors.bg_visual = "#2e3c64"

        colors.black = "#1d202f"
        colors.blue = "#7aa2ff"
        colors.blue0 = "#3d59a1"
        colors.blue1 = "#2ac3de"
        colors.blue2 = "#0db9d7"
        colors.blue5 = "#89ddff"
        colors.blue6 = "#b4f9f8"
        colors.blue7 = "#394b70"

        -- colors.cyan = "#7dcfff"
        colors.cyan = "#6a8ede"

        colors.dark3 = "#545c7e"
        colors.dark5 = "#737aa2"

        -- colors.green = "#00e08f"
        colors.green = "#27d696"
        colors.green1 = "#73daca"
        colors.green2 = "#41a6b5"
        colors.teal = "#1abc9c"

        colors.magenta = "#8f70f0"
        colors.magenta2 = "#ff007c"

        colors.purple = "#0f70f0"

        colors.orange = "#f76d47"
        colors.red = "#8f70F0"
        colors.red1 = "#db4b4b"

        colors.terminal_black = "#414868"
        colors.yellow = "#30a0c0"

        colors.gitSigns = {
          add = "#1adc9c",
          change = "#4b9be5",
          delete = "#bf555b",
        }
        colors.delta = {
          add = "#316172",
          delete = "#763842",
        }
        colors.diff = {
          add = "#283b4d",
          change = "#272d43",
          delete = "#3f2d3d",
          text = "#394b70",
        }
      end,
      -- -----------------------------------------------------------------------------------
      -- -----------------------------------------------------------------------------------
      on_highlights = function(hl, colors)
        -- local "" = ""

        hl.boolean = {
          -- fg = "#f76d47",
          fg = "#E32283",
          style = {},
        }
        hl.Constant = {
          fg = "#8f70f0",
          style = { italic = true },
        }
        -- hl.Variable = {
        --   fg = "#0000ff",
        --   style = {},
        -- }
        -- hl.string = {
        --   fg = "",
        --   style = {},
        -- }
        -- hl.Character = {
        --   fg = "#0000ff",
        -- }
        hl.number = {
          -- fg = "#f76d47",
          fg = "#E32283",
          style = {},
        }

        hl.Comment = {
          -- fg = "#60606f",
          fg = "#4a5266",
          style = {
            italic = true,
          },
        }

        hl.Keyword = {
          fg = "#4b9be5",
          style = {},
        }

        hl.namespace = {
          fg = "#0000ff",
          style = {},
        }

        hl.Operator = {
          fg = "#2050d0",
          style = {},
        }

        hl.Function = {
          -- fg = "#2fdfAf",
          fg = "#73baf5",
          style = { bold = true, italic = true },
        }

        -- hl.Hlargs = {
        --   fg = "#00ff00",
        -- }

        hl.Type = {
          fg = "#08afa3",
        }

        hl.LineNr = {
          fg = colors.dark3,
        }

        hl.CursorLineNr = {
          fg = "#2552ff",
        }

        hl.CursorLine = {
          bg = "",
        }

        hl.Title = {
          bold = true,
          fg = "#00f0ac",
        }

        hl.FlashLabel = {
          bg = "",
          bold = true,
          italic = true,
          fg = "#ff3689",
        }

        hl.FloatBorder = {
          bg = "",
          fg = "#035B78",
        }

        hl.IncSearch = {
          bg = "#f0f0f0",
          fg = "#1d202f",
        }
        hl.Search = {
          bg = "#70707f",
          fg = "#f2f2ff",
        }

        hl.DiagnosticError = {
          fg = "#ff5370",
        }

        hl.DiagnosticWarn = {
          fg = "#30a0c0",
        }

        hl.DiagnosticVirtualTextHint = {
          bg = "",
          fg = "#1abc9c",
        }

        hl.DiagnosticVirtualTextError = {
          bg = "",
          fg = "#ff5370",
        }

        hl.DiagnosticVirtualTextInfo = {
          bg = "",
          fg = "#0db9d7",
        }

        hl.DiagnosticVirtualTextWarn = {
          bg = "",
          fg = "#30a0c0",
        }

        hl.MatchParen = {
          bold = true,
          fg = "#2552ff",
        }

        -- Telescope colors --

        -- hl.TelescopeNormal = {
        --   bg = colors.bg_dark,
        --   fg = colors.fg_dark,
        -- }
        -- hl.TelescopeBorder = {
        --   bg = colors.bg_dark,
        --   fg = colors.bg_dark,
        -- }
        hl.TelescopePromptNormal = {
          bg = "",
        }
        hl.TelescopePromptBorder = {
          bg = "",
          fg = "",
        }
        hl.TelescopePromptTitle = {
          bg = "",
          fg = "",
        }
        -- hl.TelescopePreviewTitle = {
        --   bg = colors.bg_dark,
        --   fg = colors.bg_dark,
        -- }
        -- hl.TelescopeResultsTitle = {
        --   bg = colors.bg_dark,
        --   fg = colors.bg_dark,
        -- }
      end,
      -- -----------------------------------------------------------------------------------
    },
  },
}
