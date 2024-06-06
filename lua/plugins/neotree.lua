return {
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
}
