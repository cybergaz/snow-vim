return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    keys = {
        {
            "<leader>tc",
            function()
                local status = require("copilot.client").is_disabled()
                if status then
                    require("copilot.client").setup()
                    require("copilot.panel").setup()
                    require("copilot.suggestion").setup()
                    require("notify")("[Copilot] Enabled", "info", { title = "Copilot" })
                else
                    if status == nil then
                        print("status was nil")
                    end
                    require("copilot.client").teardown()
                    require("copilot.panel").teardown()
                    require("copilot.suggestion").teardown()
                    require("notify")("[Copilot] Disabled", "info", { title = "Copilot" })
                end
            end,
            silent = true,
            mode = { "n" },
            desc = "Toggle Copilot",
        },
    },
    config = function()
        require("copilot").setup({

            enabled = true,

            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<C-l>",
                    accept_line = "<C-h>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-e>",
                },
            },

            panel = {
                enabled = true,
                auto_refresh = false,
                keymap = {
                    jump_prev = "[[",
                    jump_next = "]]",
                    accept = "<CR>",
                    refresh = "gr",
                    open = "<C-;>",
                },
                layout = {
                    position = "bottom", -- | top | left | right | bottom |
                    ratio = 0.3,
                },
            },

            filetypes = {
                markdown = true,
            },
        })
    end,
}
