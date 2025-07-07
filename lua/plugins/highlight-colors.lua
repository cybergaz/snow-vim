return {
    {
        "brenoprata10/nvim-highlight-colors",
        cmd = { "HighlightColors" },
        enabled = false,
        keys = {
            {
                "<leader>hc",
                function()
                    require("nvim-highlight-colors").toggle()
                end,
                desc = "Toggle Highlight Colors",
            },
        },
        config = function()
            require("nvim-highlight-colors").setup({
                render = "virtual", --'background'|'foreground'|'virtual'
                -- virtual_symbol = "■",
                virtual_symbol = "●",
                enable_named_colors = true,
                enable_tailwind = true,
                enable_hex = true,
                enable_short_hex = true,
                enable_rgb = true,
                enable_hsl = true,
                enable_ansi = true,
                enable_hsl_without_function = true,
                enable_var_usage = true,
            })
            require("nvim-highlight-colors").turnOff()
        end,
    },
    {
        "eero-lehtinen/oklch-color-picker.nvim",
        event = "VeryLazy",
        -- enabled = false,
        keys = {
            -- One handed keymap recommended, you will be using the mouse
            {
                "<leader>ok",
                function()
                    require("oklch-color-picker").pick_under_cursor()
                end,
                desc = "Color pick under cursor",
            },
            {
                "<leader>hc",
                function()
                    require("oklch-color-picker").highlight.enable()
                end,
                desc = "Enable Highlight Colors",
            },
            {
                "<leader>hx",
                function()
                    require("oklch-color-picker").highlight.disable()
                end,
                desc = "Disable Highlight Colors",
            },
        },
        ---@type oklch.Opts
        opts = {
            highlight = {
                -- Options: 'background'|'foreground'|'virtual_left'|'virtual_eol'|'foreground+virtual_left'|'foreground+virtual_eol'
                style = "virtual_left",
                bold = false,
                italic = false,
                -- `● ` also looks nice, nerd fonts also have bigger shapes ` `, `󰝤 `, and ` `.
                virtual_text = "● ",
            },
        },
    },
}
