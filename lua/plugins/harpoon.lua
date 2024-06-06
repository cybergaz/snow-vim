return {
    "ThePrimeagen/harpoon",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    branch = "harpoon2",
    config = true,
    opts = function(_)
        require("harpoon"):setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = false,
            },
        })
    end,

    keys = {
        {
            "<leader>hh",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Mark file with harpoon",
        },
        {
            "<leader>hr",
            function()
                require("harpoon"):list():remove()
            end,
            desc = "Remove harpoon marks",
        },
        {
            "<leader>hl",
            function()
                require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
            end,
            desc = "Harpoon List",
        },
        {
            "<A-h>",
            function()
                require("harpoon"):list():prev({ ui_nav_wrap = true })
            end,
        },
        {
            "<A-l>",
            function()
                require("harpoon"):list():next({ ui_nav_wrap = true })
            end,
        },
        {
            "<leader>1",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Switch to harpoon 1",
        },
        {
            "<leader>2",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Switch to harpoon 2",
        },
        {
            "<leader>3",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Switch to harpoon 3",
        },
        {
            "<leader>4",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Switch to harpoon 4",
        },
        {
            "<leader>5",
            function()
                require("harpoon"):list():select(5)
            end,
            desc = "Switch to harpoon 5",
        },

        -- HARPOON 1 config
        --   { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
        --   { "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
        --   { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove harpoon marks" },
        --   { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
        --   { "<S-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
        --   -- { "<C-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
        --   { "<S-h>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
        --   { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoon file 1" },
        --   { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoon file 2" },
        --   { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoon file 3" },
        --   { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "harpoon file 4" },
        --   { "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "harpoon file 5" },
    },
}
