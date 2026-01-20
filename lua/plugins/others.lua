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
                { "<leader>be", "<cmd>Neotree buffers reveal float<cr>", desc = "neo tree buffers" },
            }
        end,
        opts = {
            popup_border_style = "rounded",
        },
    },

    -------------------------------------------------------------------
    -- dressing
    -------------------------------------------------------------------
    -- stylua: ignore start
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...) require("lazy").load({ plugins = { "dressing.nvim" } }) return vim.ui.select(...) end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...) require("lazy").load({ plugins = { "dressing.nvim" } }) return vim.ui.input(...) end
        end,
    },
    -- stylua: ignore end

    -------------------------------------------------------------------
    -- autopairs
    -------------------------------------------------------------------
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
        dependencies = {
            "windwp/nvim-ts-autotag",
            opts = {
                opts = {
                    -- Defaults
                    enable_close = true, -- Auto close tags
                    enable_rename = true, -- Auto rename pairs of tags
                    enable_close_on_slash = true, -- Auto close on trailing </
                },
            },
        },
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
            italic = true,
        },
    },

    ----------------------------------------------------------------------------------------
    -- Flash
    ----------------------------------------------------------------------------------------
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     opts = {},
    --     -- stylua: ignore start
    --     keys = {
    --         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --         { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --         { "r", false},
    --         { "R", false },
    --         { "<c-s>", false },
    --     },
    --
    --     -- stylua: ignore end
    -- },

    ----------------------------------------------------------------------------------------
    -- vim-flog : more visually appealing git log
    ----------------------------------------------------------------------------------------
    {
        "rbong/vim-flog",
        lazy = true,
        cmd = { "Flog", "Flogsplit", "Floggit" },
        dependencies = {
            "tpope/vim-fugitive",
        },
        keys = {
            { "<leader>gl", "<cmd>Flogsplit -all -graph<cr>", desc = "Git log (vim-flog)" },
        },
    },

    ----------------------------------------------------------------------------------------
    -- nvim-scissors : snippet manager
    ----------------------------------------------------------------------------------------
    {
        "chrisgrieser/nvim-scissors",
        dependencies = "nvim-telescope/telescope.nvim", -- if using telescope
        enabled = true,
        opts = {
            snippetDir = "~/.config/nvim/snippets/",
        },
        keys = {
            {
                "<leader>xe",
                mode = { "n" },
                function()
                    require("scissors").editSnippet()
                end,
                desc = "Snippet: Edit",
            },

            {
                "<leader>xa",
                mode = { "n", "x" },
                function()
                    require("scissors").addNewSnippet()
                end,
                desc = "Snippet: Add",
            },
        },
    },

    ----------------------------------------------------------------------------------------
    -- typescript-tools.nvim : TypeScript utilities
    ----------------------------------------------------------------------------------------
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- },

    ----------------------------------------------------------------------------------------
    -- kulala.nvim : REST client
    ----------------------------------------------------------------------------------------
    {
        "mistweaverco/kulala.nvim",
        keys = {
            -- { "<leader>rs", desc = "Send request" },
            -- { "<leader>ra", desc = "Send all requests" },
            -- { "<leader>rb", desc = "Open scratchpad" },
        },
        ft = { "http", "rest" },
        opts = {
            global_keymaps = false,
            global_keymaps_prefix = "<leader>r",
            kulala_keymaps_prefix = "",
            kulala_keymaps = {
                ["Show verbose"] = {
                    "I",
                    function()
                        require("kulala.ui").show_verbose()
                    end,
                },
            },

            ui = {
                -- display mode: possible values: "split", "float"
                display_mode = "float",
                -- split direction: possible values: "vertical", "horizontal"
                split_direction = "horizontal",
                -- default view: "body" or "headers" or "headers_body" or "verbose" or fun(response: Response)
                default_view = "body",
                -- enable winbar
                winbar = false,
                -- window options to override defaults: width/height/split/vertical
                win_opts = {
                    border = {
                        { "╭", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╮", "FloatBorder" },
                        { "│", "FloatBorder" },
                        { "╯", "FloatBorder" },
                        { "─", "FloatBorder" },
                        { "╰", "FloatBorder" },
                        { "│", "FloatBorder" },
                    },
                },
            },
        },
    },

    -- {
    --     "nvim-java/nvim-java",
    --     opts = {},
    --     -- config = function()
    --     --     require("java").setup()
    --     -- end,
    -- },

    ----------------------------------------------------------------------------------------
    -- better git diff and merge
    ----------------------------------------------------------------------------------------
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
        keys = {
            { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git diff" },
            { "<leader>gc", "<cmd>DiffviewClose<cr>", desc = "Git diff close" },
        },
    },

    ----------------------------------------------------------------------------------------
    -- Flash
    ----------------------------------------------------------------------------------------
    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         highlight = {
    --             -- show a backdrop with hl FlashBackdrop
    --             backdrop = true,
    --             -- Highlight the search matches
    --             matches = false,
    --             -- extmark priority
    --             priority = 5000,
    --             groups = {
    --                 match = "FlashMatch",
    --                 current = "FlashCurrent",
    --                 backdrop = "FlashBackdrop",
    --                 label = "FlashLabel",
    --             },
    --         },
    --     },
    --     -- stylua: ignore start
    --     keys = {
    --         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --         { "S", false },
    --         -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --         { "r", false},
    --         { "R", false },
    --         { "<c-s>", false },
    --     },
    -- },

    -- {
    --     "A7Lavinraj/fyler.nvim",
    --     dependencies = { "nvim-tree/nvim-web-devicons" },
    --     branch = "stable",
    --     lazy = false,
    --     opts = {
    --         integrations = {
    --             icon = "nvim_web_devicons",
    --         },
    --         views = {
    --             finder = {
    --                 win = {
    --                     kinds = {
    --                         float = {
    --                             height = "80%",
    --                             width = "50%",
    --                             top = "5%",
    --                             left = "25%",
    --                         },
    --                     },
    --                 },
    --             },
    --         },
    --     },
    --     keys = {
    --         { "<leader>E", "<Cmd>Fyler kind=float<Cr>", desc = "Open Fyler View" },
    --     },
    -- },
}
