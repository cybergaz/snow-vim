return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
        return {
            inlay_hints = {
                enabled = false,
                exclude = {}, -- filetypes for which you don't want to enable inlay hints
            },
            -- codelens = {
            --     enabled = false,
            -- },
            -- -- Enable lsp cursor word highlighting
            -- document_highlight = {
            --     enabled = true,
            -- },
        }
    end,
    config = function(_, opts)
        local mason_registry = require("mason-registry")

        -- Diagnostics
        vim.diagnostic.config({
            signs = false,
            underline = true,
            update_in_insert = false,
            -- severity_sort = true,
            virtual_text = {
                spacing = 6,
                source = "if_many",
                prefix = "●",
            },
        })

        -- Run setup for mason installed servers
        for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
            require("lspconfig")[server].setup({})
        end

        -- copilot fix for rust
        -- require("lspconfig").clangd.setup({
        --   on_attach = on_attach,
        --   capabilities = require("cmp_nvim_lsp").default_capabilities(),
        --   cmd = {
        --     "clangd",
        --     "--offset-encoding=utf-16",
        --   },
        -- }),

        -- Go
        require("lspconfig").gopls.setup({
            settings = {
                gopls = {
                    completeUnimported = true,
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            },
        })
    end,
}
