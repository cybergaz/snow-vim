return {
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

            logo = string.rep("\n", 10) .. logo .. "\n\n"

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
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = 'lua require("persistence").select()',                      desc = " Recent sessions", icon = " ", key = "r" },
          { action = 'lua require("persistence").load()',                        desc = " Last Session",    icon = " ", key = "s" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
                    footer = function()
                        local stats = require("lazy").stats()
                        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        return {
                            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
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
}
