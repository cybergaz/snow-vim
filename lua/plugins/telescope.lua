return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/.build/**" },
                },
            },
            defaults = {
                hidden = true,
                prompt_prefix = " ",
                selection_caret = " ",
                -- entry_prefix = "  ",

                -- sorting_strategy = "ascending",
                -- layout_strategy = "horizontal",

                -- layout_config = {
                --     horizontal = {
                --         prompt_position = "top",
                --         preview_width = 0.55,
                --         results_width = 0.8,
                --     },
                --     vertical = {
                --         mirror = false,
                --     },
                --     width = 0.87,
                --     height = 0.80,
                --     preview_cutoff = 120,
                -- },
                path_display = {
                    filename_first = {
                        reverse_directories = false,
                    },
                },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- send all to quickfix list
                        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfix list
                        ["<C-f>"] = actions.preview_scrolling_down,
                        ["<C-b>"] = actions.preview_scrolling_up,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                },
            },
        })
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>k", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Find Oldfiles (Recents)" },
        { "<leader>;", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>lg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find word under the cursor" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
        { "<leader>j", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
        { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics" },
        { "<leader>ft", "<cmd>Telescope<cr>", desc = "Other pickers..." },
        { "<leader>fgc", "<cmd>Telescope git_commits<cr>", desc = "Find Git Commmits" },
        { "<leader>fgb", "<cmd>Telescope git_branches<cr>", desc = "Find Git Branches" },
        { "<leader>fgx", "<cmd>Telescope git_bcommits<cr>", desc = "Find Git Current Branch Commits" },
        { "<leader>fgs", "<cmd>Telescope git_stash<cr>", desc = "Find Git Stash Items" },
    },
}
