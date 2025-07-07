return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    opts = {
        preset = "helix",
        show_help = false,

        delay = function(ctx)
            return ctx.plugin and 0 or 200
        end,

        icons = {
            mappings = false,
        },
        win = {
            title_pos = "center",
        },

        -- modes = {
        --     n = true, -- Normal mode
        --     i = true, -- Insert mode
        --     x = false, -- Visual mode
        --     s = true, -- Select mode
        --     o = true, -- Operator pending mode
        --     t = true, -- Terminal mode
        --     c = true, -- Command mode
        -- },
        spec = {
            -- { "<leader>a", group = "ai" },
            { "<leader>b", group = "buffer" },
            { "<leader>c", group = "code" },
            { "<leader>f", group = "file/find" },
            { "<leader>fg", group = "find git" },
            { "<leader>g", group = "git" },
            { "<leader>n", group = "noice" },
            { "<leader>t", group = "toggle" },
            { "<leader>h", group = "hint/HColor" },
            { "<leader>u", group = "toggle" },
            { "<leader>w", group = "windows" },
            { "<leader>x", group = "snippet" },
            { "<leader>l", group = "Lazy" },
        },
    },
}
