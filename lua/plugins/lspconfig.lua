return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mason-org/mason.nvim",
        { "mason-org/mason-lspconfig.nvim", opts = {} },
        "saghen/blink.cmp",
        -- "hrsh7th/cmp-nvim-lsp",
    },
    opts = {},
    config = function(_, opts)
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
                -- severity = { max = "WARN" },
            },

            virtual_lines = false,
            -- virtual_lines = {
            --     current_line = true,
            --     severity = { min = "WARN" },
            -- },

            float = {
                focusable = true,
                -- style = "minimal",
                border = "rounded",
                -- source = true,
                -- header = "",
            },
        })

        local capabilities = require("blink.cmp").get_lsp_capabilities()

        -- Run setup for mason installed servers
        -- require("notify")("installed server", "info", { title = "lsp conf" })
        -- require("notify")(require("mason-lspconfig").get_installed_servers())
        -- for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
        --     vim.lsp.enable(server)
        --     vim.lsp.config(server, { capabilities = capabilities, handlers = handlers })
        -- end

        -- ts_ls
        local inlayHints = {
            -- includeInlayVariableTypeHints = true,
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        }

        --typescript and javascript lsp
        -- vim.lsp.enable("ts_ls")
        vim.lsp.config("ts_ls", {
            -- cmd = {
            --     "bun",
            --     "/home/gaz/workspace/gclones/typescript-language-server/lib/cli.mjs",
            --     "--stdio",
            -- },
            settings = {
                typescript = {
                    inlayHints = inlayHints,
                    format = {
                        -- indentStyle = "None", -- 'None' | 'Block' | 'Smart'
                        semicolons = "insert", -- 'ignore' | 'insert' | 'remove';
                    },
                    generateReturnInDocTemplate = false,
                    displayPartsForJSDoc = false,
                    preferences = {
                        generateReturnInDocTemplate = false,
                        displayPartsForJSDoc = false,
                    },
                    -- suggest = {
                    --     completeJSDocs = false,
                    --     jsdoc = { generateReturns = false },
                    -- },
                },
                displayPartsForJSDoc = false,
                generateReturnInDocTemplate = false,
                -- javascript = {
                --     inlayHints = inlayHints,
                -- },
            },
            preferences = {
                generateReturnInDocTemplate = false,
            },
            capabilities = capabilities,
            -- handlers = handlers,
        })

        -- Rust
        vim.lsp.enable("rust_analyzer")

        -- Go
        vim.lsp.config("gopls", {
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
            -- handlers = handlers,
        })

        -- dart
        vim.lsp.enable("dartls")
        vim.lsp.config("dartls", {
            cmd = { "dart", "language-server", "--protocol=lsp" },
            filetypes = { "dart" },
            init_options = {
                closingLabels = true,
                flutterOutline = true,
                onlyAnalyzeProjectsWithOpenFiles = true,
                outline = true,
                suggestFromUnimportedLibraries = true,
            },
            settings = {
                dart = {
                    completeFunctionCalls = true,
                    showTodos = true,
                },
            },
        })

        -- swift
        vim.lsp.config("sourcekit", {
            capabilities = {
                workspace = {
                    didChangeWatchedFiles = {
                        dynamicRegistration = true,
                    },
                },
            },
            -- handlers = handlers,
        })

        -- java lsp
        vim.lsp.config("jdtls", { cmd = { "jdtls" } })

        -- qml lsp
        vim.lsp.enable("qmlls")
    end,
}
