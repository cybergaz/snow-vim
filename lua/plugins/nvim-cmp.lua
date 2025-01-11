return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    enabled = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        -- "onsails/lspkind.nvim",
        {
            "garymjr/nvim-snippets",
            opts = {
                friendly_snippets = true,
            },
            dependencies = { "rafamadriz/friendly-snippets" },
        },
    },

    config = function()
        local cmp = require("cmp")
        local max_items = 5
        local kind_icons = {
            Array = "",
            Boolean = "󰨙",
            Class = "󰠱",
            Color = "󰏘",
            Control = "",
            Collapsed = "",
            Constant = "󰏿",
            Constructor = "",
            Copilot = "",
            Enum = "⌘",
            EnumMember = "⌘",
            Event = "",
            Field = "",
            File = "",
            Folder = "",
            Function = "󰊕",
            Interface = "",
            Keyword = "",
            Method = "󰊕",
            Module = "󰆧",
            Package = " ",
            Namespace = "󰦮",
            Null = "",
            Number = "󰎠",
            Operator = "󰆕",
            Object = "󰘦",
            Property = "",
            Reference = "󰈇",
            -- Snippet = "",
            Snippet = "",
            Struct = "󰆼",
            Text = "",
            String = "",
            TypeParameter = "󰅲",
            Value = "󰎠",
            Unit = "",
            Variable = "𝑣",
        }
        cmp.setup({
            window = {
                -- stylua: ignore start
                -- { "╭", "Comment" },
                completion = {
                    border = { { "󱐋", "WarningMsg" }, { "─", "Comment" }, { "╮", "Comment" }, { "│", "Comment" }, { "╯", "Comment" }, { "─", "Comment" }, { "╰", "Comment" }, { "│", "Comment" }, },
                    scrollbar = false,
                },
                documentation = {
                    border = { { "i", "DiagnosticHint" }, { "─", "Comment" }, { "╮", "Comment" }, { "│", "Comment" }, { "╯", "Comment" }, { "─", "Comment" }, { "╰", "Comment" }, { "│", "Comment" }, },
                    scrollbar = false,
                },
                -- stylua: ignore end
            },

            completion = {
                completeopt = "menu,menuone,preview,noinsert",
            },

            -- stylua: ignore start
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<cr>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true, }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
            }),
            -- stylua: ignore end

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "snippets" },
                { name = "buffer" },
                { name = "path" },
            }),

            -- lsp-kind icons & custom cmp menu icons
            -- if you want one less dependency , visit : https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#basic-customisations
            formatting = {
                -- format = require("lspkind").cmp_format({ mode = "symbol_text", }),
                format = function(_, vim_item)
                    -- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
                    vim_item.kind = string.format(" %s", kind_icons[vim_item.kind])
                    -- Source
                    -- vim_item.menu = ({
                    --     buffer = "[Buffer]",
                    --     nvim_lsp = "[LSP]",
                    --     luasnip = "[LuaSnip]",
                    --     nvim_lua = "[Lua]",
                    --     latex_symbols = "[LaTeX]",
                    -- })[entry.source.name]
                    return vim_item
                end,
            },

            experimental = {
                ghost_text = true,
            },

            view = {
                entries = {
                    name = "custom",
                    selection_order = "top_down",
                    follow_cursor = false,
                },
                docs = {
                    auto_open = true,
                },
            },
        })

        -- insert braces after selecting function or method item
        cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end,

    keys = {
        {
            "<Tab>",
            function()
                return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
            end,
            expr = true,
            silent = true,
            mode = { "i", "s" },
        },
        {
            "<S-Tab>",
            function()
                return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<Tab>"
            end,
            expr = true,
            silent = true,
            mode = { "i", "s" },
        },
    },
}
