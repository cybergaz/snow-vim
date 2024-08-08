return {
    "cbochs/grapple.nvim",
    opts = {
        scope = "git", -- also try out "git_branch"
        statusline = {
            icon = "󰀱",
            active = "|%s|",
            inactive = " %s ",
        },
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
        { "<leader>p", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
        { "<leader>m", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
        { "<S-l>", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
        { "<S-h>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
        {
            "<leader>ww",
            function()
                if require("grapple").exists() then
                    require("grapple").toggle()
                    vim.cmd("bdelete!")
                else
                    vim.cmd("bdelete!")
                end
            end,
            desc = "Grapple delete buffer",
        },
        {
            "<C-x>",
            function()
                if require("grapple").exists() then
                    require("grapple").toggle()
                    vim.cmd("bdelete!")
                else
                    vim.cmd("bdelete!")
                end
            end,
            desc = "Grapple delete buffer",
        },
    },
}
