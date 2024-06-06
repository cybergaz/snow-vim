return {
    "brenoprata10/nvim-highlight-colors",
    cmd = { "HighlightColors" },
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
        })
        require("nvim-highlight-colors").turnOff()
    end,
}
