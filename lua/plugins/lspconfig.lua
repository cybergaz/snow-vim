return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
        -- "hrsh7th/cmp-nvim-lsp",
    },
    opts = function()
        return {
            -- inlay_hints = {
            --     enabled = false,
            --     exclude = {}, -- filetypes for which you don't want to enable inlay hints
            -- },
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
        local lspconfig = require("lspconfig")
        -- local mason_registry = require("mason-registry")

        -- setting its value to true helps in toggling inlay_hints
        vim.lsp.inlay_hint.enable(true)
        -- vim.lsp.hover({ buffer = "rounded" })

        -- Diagnostics
        vim.diagnostic.config({
            signs = {
                severity = { min = "ERROR" },
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,

            virtual_text = {
                spacing = 5,
                source = "if_many",
                prefix = "●",
                current_line = false,
                severity = { max = "WARN" },
            },

            virtual_lines = {
                current_line = true,
                severity = { min = "WARN" },
            },

            float = {
                focusable = true,
                -- style = "minimal",
                border = "rounded",
                -- source = true,
                -- header = "",
            },
        })

        -- local border = {
        --     { "╭", "Comment" },
        --     { "─", "Comment" },
        --     { "╮", "Comment" },
        --     { "│", "Comment" },
        --     { "╯", "Comment" },
        --     { "─", "Comment" },
        --     { "╰", "Comment" },
        --     { "│", "Comment" },
        -- }

        -- LSP settings (for overriding per client)
        -- local handlers = {
        --     ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        --     ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
        -- }

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Run setup for mason installed servers
        -- require("notify")("installed server", "info", { title = "lsp conf" })
        -- require("notify")(require("mason-lspconfig").get_installed_servers())
        for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
            -- ----------------------------------------------------
            -- temporary fix for tsserver deprecation warning
            -- if server == "tsserver" then
            --     server = "ts_ls"
            -- end
            -- ----------------------------------------------------
            lspconfig[server].setup({ capabilities = capabilities, handlers = handlers })
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

        -- ts_ls
        local inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            -- includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
        }

        lspconfig.ts_ls.setup({
            settings = {
                typescript = {
                    inlayHints = inlayHints,
                },
                javascript = {
                    inlayHints = inlayHints,
                },
            },
            capabilities = capabilities,
            handlers = handlers,
        })

        -- Go
        lspconfig.gopls.setup({
            settings = {
                gopls = {
                    completeUnimported = true,
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                },
            },
            capabilities = capabilities,
            handlers = handlers,
        })

        -- swift
        lspconfig.sourcekit.setup({
            capabilities = {
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true,
                    },
                },
            },
            handlers = handlers,
        })

        lspconfig.jdtls.setup({ cmd = { "jdtls" } })
    end,
}
