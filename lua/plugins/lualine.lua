return {
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
                disabled_filetypes = { statusline = { "dashboard", "alpha", "Telescope" } },
            },
            sections = {
                lualine_a = {
                    { "mode", icon = "" },
                    -- icon = ""
                },
                lualine_b = {
                    { "branch", icon = "", padding = { left = 2, right = 1 }, color = { fg = "#1abc9c" } },

                    -- { "grapple", separator = "", padding = { left = 2, right = 1 } },

                    -- buffer count
                    {
                        function()
                            local count = #vim.fn.getbufinfo({ buflisted = 1 })
                            return " 󰂺 " .. count
                        end,
                        padding = { left = 1, right = 1 },
                        color = { fg = colors.grey },
                    },

                    -- {
                    --     "filename",
                    --     path = 0,
                    --     symbols = { modified = "+", readonly = "", unnamed = "", newfile = "" },
                    --     padding = { left = 0, right = 3 },
                    --     color = { fg = "#ffffff" },
                    -- },
                },
                lualine_c = {
                    -- "%=", -- center separator

                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    -- PATH (gray) FILENAME (white)
                    {
                        function()
                            local path = vim.fn.expand("%:~:.:h")
                            local file = vim.fn.expand("%:t")

                            local modified = vim.bo.modified and " 🖉" or ""
                            local readonly = vim.bo.readonly and " 🛇" or ""

                            if path == "." or path == "" then
                                return table.concat({
                                    "%#LualineFile#",
                                    file,
                                    modified,
                                    readonly,
                                })
                            end

                            return table.concat({
                                "%#LualinePath#",
                                path .. "/",
                                "%#LualineFile#",
                                file,
                                "%#LualineFileIcon#",
                                modified,
                                readonly,
                            })
                        end,
                        separator = "",
                        padding = { left = 0, right = 1 },
                    },

                    -- {
                    --     "filename",
                    --     path = 1,
                    --     symbols = { modified = "🖉", readonly = "🛇", unnamed = "" },
                    --     padding = { left = 0, right = 1 },
                    --     color = { fg = colors.grey },
                    -- },

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
                            local mode = require("noice").api.statusline.mode.get()
                            if mode then
                                return string.match(mode, "^recording @.*") or ""
                            end
                            return ""
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
                            local icon = ""
                            local status = require("copilot.api").status.data
                            return icon .. (status.message or "")
                        end,
                        cond = function()
                            local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
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

            extensions = { "lazy", "mason", "neo-tree" },
        }
    end,
    config = function(_, opts)
        require("lualine").setup(opts)
        vim.api.nvim_set_hl(0, "LualinePath", { fg = "#7b8496", bg = "NONE" })
        vim.api.nvim_set_hl(0, "LualineFile", { fg = "#ffffff", bg = "NONE", bold = true })
        vim.api.nvim_set_hl(0, "LualineFileIcon", { fg = "#ffffff", bg = "NONE", bold = false })
    end,
}
