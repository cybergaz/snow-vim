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
            -- popup_border_style = "none",
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
    -- Oil.nvim : File Explorer
    ----------------------------------------------------------------------------------------
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        keys = {
            { "<leader>o", "<cmd>Oil --float .<cr>", desc = "Oil File Explorer" },
        },
        opts = {
            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = false,
            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = true,
            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            -- (:help prompt_save_on_select_new_entry)
            prompt_save_on_select_new_entry = false,

            view_options = {
                -- Show files and directories that start with "."
                show_hidden = true,
            },

            keymaps = {
                ["g?"] = { "actions.show_help", mode = "n" },
                ["<CR>"] = "actions.select",
                ["<C-s>"] = { "actions.select", opts = { vertical = true } },
                ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
                ["<C-t>"] = { "actions.select", opts = { tab = true } },
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = { "actions.close", mode = "n" },
                ["<ESC>"] = { "actions.close", mode = "n" },
                ["<C-e>"] = { "actions.close", mode = "n" },
                ["<C-l>"] = "actions.refresh",
                ["-"] = { "actions.parent", mode = "n" },
                ["_"] = { "actions.open_cwd", mode = "n" },
                ["`"] = { "actions.cd", mode = "n" },
                ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
                ["gs"] = { "actions.change_sort", mode = "n" },
                ["gx"] = "actions.open_external",
                ["g."] = { "actions.toggle_hidden", mode = "n" },
                ["H"] = { "actions.toggle_hidden", mode = "n" },
                ["g\\"] = { "actions.toggle_trash", mode = "n" },
                ["gd"] = {
                    desc = "Toggle file detail view",
                    callback = function()
                        detail = not detail
                        if detail then
                            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                        else
                            require("oil").set_columns({ "icon" })
                        end
                    end,
                },
            },

            float = {
                -- Padding around the floating window
                padding = 2,
                -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                max_width = 0.5,
                max_height = 0.85,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
                -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
                get_win_title = nil,
                -- preview_split: Split direction: "auto", "left", "right", "above", "below".
                preview_split = "auto",
                -- This is the config that will be passed to nvim_open_win.
                -- Change values here to customize the layout
                override = function(conf)
                    return conf
                end,
            },

            preview_win = {
                -- Whether the preview window is automatically updated when the cursor is moved
                update_on_cursor_moved = true,
                -- How to open the preview window "load"|"scratch"|"fast_scratch"
                preview_method = "fast_scratch",
                -- A function that returns true to disable preview on a file e.g. to avoid lag
                disable_preview = function(filename)
                    return false
                end,
                -- Window-local options to use for preview window buffers
                win_options = {},
            },
        },
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
        -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
        lazy = false,
    },

    ----------------------------------------------------------------------------------------
    -- kulala.nvim : REST client
    ----------------------------------------------------------------------------------------
    -- {
    --     "mistweaverco/kulala.nvim",
    --     keys = {
    --         { "<leader>rs", desc = "Send request" },
    --         { "<leader>ra", desc = "Send all requests" },
    --         { "<leader>rb", desc = "Open scratchpad" },
    --     },
    --     ft = { "http", "rest" },
    --     opts = {
    --         -- your configuration comes here
    --         global_keymaps = true,
    --     },
    -- },

    -- {
    --     "nvim-java/nvim-java",
    --     opts = {},
    --     -- config = function()
    --     --     require("java").setup()
    --     -- end,
    -- },
}
