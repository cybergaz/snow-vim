return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "mason-org/mason.nvim",
        { "mason-org/mason-lspconfig.nvim", opts = {} },
        "saghen/blink.cmp",
        -- "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
        -- automatic_enable = false,

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
    },
    config = function(_, opts)
        -- local lspconfig = vim.lsp.config()
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
        -- for _, server in pairs(require("mason-lspconfig").get_installed_servers()) do
        --     -- ----------------------------------------------------
        --     -- temporary fix for tsserver deprecation warning
        --     -- if server == "tsserver" then
        --     --     server = "ts_ls"
        --     -- end
        --     -- ----------------------------------------------------
        --     vim.lsp.enable(server)
        --     vim.lsp.config(server, { capabilities = capabilities, handlers = handlers })
        -- end

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

        --typescript and javascript lsp
        vim.lsp.config("ts_ls", {
            settings = {
                typescript = {
                    inlayHints = inlayHints,
                },
                -- javascript = {
                --     inlayHints = inlayHints,
                -- },
            },
            capabilities = capabilities,
            handlers = handlers,
        })

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
            handlers = handlers,
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
            handlers = handlers,
        })

        -- java lsp
        vim.lsp.config("jdtls", { cmd = { "jdtls" } })

        -- qml lsp
        vim.lsp.enable("qmlls")
    end,
}
