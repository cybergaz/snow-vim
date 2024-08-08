return {
    -------------------------------------------------------------------
    -- neo-tree
    -------------------------------------------------------------------
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = function()
            return {
                { "<leader>e", "<cmd>Neotree float<cr>", desc = "neo tree float" },
            }
        end,
    },

    -------------------------------------------------------------------
    -- dressing
    -------------------------------------------------------------------
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },

    -------------------------------------------------------------------
    -- autopairs
    -------------------------------------------------------------------
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },

    -------------------------------------------------------------------
    -- surround
    -------------------------------------------------------------------
    {
        "kylechui/nvim-surround",
        event = "BufReadPost",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },

    -------------------------------------------------------------------
    -- persistence sessions
    -------------------------------------------------------------------
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = { options = vim.opt.sessionoptions:get() },
    },

    -------------------------------------------------------------------
    -- ts comments
    -------------------------------------------------------------------
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has("nvim-0.10.0") == 1,
    },

    -------------------------------------------------------------------
    -- end-inlay-hints
    -------------------------------------------------------------------
    {
        "chrisgrieser/nvim-lsp-endhints",
        event = "LspAttach",
        opts = { -- required, even if empty
            -- type = "󰜁 ", parameter = "󰏪 ",
            icons = { type = "=> ", parameter = "<- " },
        },
    },
}