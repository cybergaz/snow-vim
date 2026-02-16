return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        local ts = require("nvim-treesitter")
        vim.notify = require("notify")

        -- Ensure tree-sitter CLI exists
        if vim.fn.executable("tree-sitter") == 0 then
            vim.defer_fn(function()
                vim.notify(
                    "nvim-treesitter: 'tree-sitter' CLI not found in PATH.\nCan't proceed with the tree-sitter setup.",
                    vim.log.levels.ERROR,
                    { title = "nvim-treesitter" }
                )
            end, 1000) -- 1000 ms = 1 seconds
            return
        end

        local should_install = {
            "bash",
            "fish",
            "javascript",
            "typescript",
            "jsx",
            "tsx",
            "html",
            "css",
            "json",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "regex",
            "vim",
            "vimdoc",
            "yaml",
            "toml",
            "rust",
        }

        ----------------------------------------------------------------------
        -- Pre-install known languages (async, no blocking)
        ----------------------------------------------------------------------
        ts.install(should_install)

        ----------------------------------------------------------------------
        -- Enable Tree-sitter highlighting for installed languages/parsers
        ----------------------------------------------------------------------
        local installed_parsers = ts.get_installed()
        local available_parsers = ts.get_available()

        if #installed_parsers > 0 then
            vim.api.nvim_create_autocmd("FileType", {
                callback = function(event)
                    if vim.list_contains(installed_parsers, vim.treesitter.language.get_lang(event.match)) then
                        vim.treesitter.start(event.buf)
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
            })
        end

        ----------------------------------------------------------------------
        -- Auto-install missing parsers and ATTACH when install completes
        ----------------------------------------------------------------------
        vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
            callback = function(event)
                local bufnr = event.buf
                local ft = vim.bo[bufnr].filetype
                local lang = vim.treesitter.language.get_lang(ft)

                -- Skip if no filetype or no parser lang could be determined
                if ft == "" or not lang then
                    return
                end

                -- unsupported language
                if not vim.list_contains(available_parsers, lang) then
                    return
                end

                -- already installed and configured
                if vim.list_contains(installed_parsers, lang) then
                    return
                end

                vim.notify("Installing Tree-sitter parser for: " .. lang, "info", { title = "nvim-treesitter" })

                -- async install with reload
                ts.install({ lang })
            end,
        })
    end,
}
