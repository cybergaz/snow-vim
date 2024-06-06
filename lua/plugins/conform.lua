return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    event = "BufReadPre",
    config = function()
        vim.g.disable_autoformat = false
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                sh = { "shfmt" },
            },

            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                async = false, -- not recommended to change
                quiet = false, -- not recommended to change
                lsp_fallback = true,
            },

            formatters = {
                injected = { options = { ignore_errors = true } },
            },
        })

        -- override stylua's default indent type
        require("conform").formatters.stylua = {
            prepend_args = { "--indent-type", "spaces" },
        }

        -- Toggle format on save
        vim.api.nvim_create_user_command("ConformToggle", function()
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            print("Conform " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
        end, {
            desc = "Toggle format on save",
        })
    end,
}
