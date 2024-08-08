return {
    ----------------------------------------------------------------------------------------
    -- cyberdream theme configuration
    ----------------------------------------------------------------------------------------
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        -- enabled = false,
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
                        yellow = "#F8D68C",
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
                        Number = { fg = "#E32283" },
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

                        -- Indent Blankline / mini indent
                        MiniIndentscopeSymbol = { fg = "#60606b" },
                        -- IblIndent = { fg = "#292E3D" },
                        IblIndent = { fg = "#30defc" },
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
            vim.cmd("colorscheme cyberdream") -- set the colorscheme
        end,
    },

    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         style = "storm",
    --         transparent = true,
    --     },
    --     config = function(_, _)
    --         vim.cmd("colorscheme tokyonight-storm") -- set the colorscheme
    --     end,
    -- },
}
