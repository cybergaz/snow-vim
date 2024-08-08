return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    enabled = false,
    keys = {
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
        -- { "<leader>p", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
        { "<leader>bx", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
        { "<leader>bq", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
        { "<M-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<M-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        { "[b", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
        { "]b", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    opts = {
        options = {
            indicator = { style = "none" },
            buffer_close_icon = "",
            -- hover = {
            --     enabled = true,
            --     delay = 200,
            --     reveal = { "close" },
            -- },
            separator_style = { "", "" },
            always_show_bufferline = false,
            diagnostics = "nvim_lsp",
            -- diagnostics_indicator = function(_, _, diag)
            --     local icons = require("lazyvim.config").icons.diagnostics
            --     local ret = (diag.error and icons.error .. diag.error .. " " or "")
            --         .. (diag.warning and icons.warn .. diag.warning or "")
            --     return vim.trim(ret)
            -- end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Explorer",
                    text_align = "center",
                },
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        -- Fix bufferline when restoring a session
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}
