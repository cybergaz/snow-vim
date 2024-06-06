return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 200
    end,
    opts = {
        defaults = {
            mode = { "n", "v" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>c"] = { name = "+code" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>r"] = { name = "+run" },
            ["<leader>w"] = { name = "+windows" },
            ["<leader>x"] = { name = "+diagnostics/quickfix" },
            ["<leader>n"] = { name = "+noice" },
            ["<leader>u"] = { name = "+ui" },
            ["<leader>q"] = { name = "+session" },
            ["<leader>g"] = { name = "+git-signs" },
            ["<leader>h"] = { name = "+hints" },
            ["<leader>s"] = { name = "+spectre" },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.defaults)
    end,
}
