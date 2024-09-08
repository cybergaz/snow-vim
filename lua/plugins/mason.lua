return {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    -- dependencies = {
    --     "williamboman/mason-lspconfig.nvim"
    -- },
    opts = {
        ensure_installed = {
            "stylua",
            "shfmt",
        },
        ui = {
            width = 0.8,
            height = 0.8,
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
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
        require("mason").setup(opts)
        local mr = require("mason-registry")
        mr:on("package:install:success", function()
            vim.defer_fn(function()
                -- trigger FileType event to possibly load this newly installed LSP server
                require("lazy.core.handler.event").trigger({
                    event = "FileType",
                    buf = vim.api.nvim_get_current_buf(),
                })
            end, 100)
        end)

        mr.refresh(function()
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end)

        require("mason-lspconfig").setup_handlers({
            -- Will be called for each installed server that doesn't have
            -- a dedicated handler.
            --
            function(server_name) -- default handler (optional)
                -- https://github.com/neovim/nvim-lspconfig/pull/3232
                if server_name == "tsserver" then
                    server_name = "ts_ls"
                end
                local capabilities = require("cmp_nvim_lsp").default_capabilities()
                require("lspconfig")[server_name].setup({

                    capabilities = capabilities,
                })
            end,
        })
    end,
}
