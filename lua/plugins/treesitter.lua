return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            init = function()
                -- disable rtp plugin, as we only need its queries for mini.ai
                -- In case other textobject modules are enabled, we will load them
                -- once nvim-treesitter is loaded
                require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                load_textobjects = true
            end,
        },
    },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
        { "<c-space>", desc = "Increment Selection" },
        { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
            "bash",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "rust",
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },

    config = function(_, opts)
        if type(opts.ensure_installed) == "table" then
            ---@type table<string, boolean>
            local added = {}
            opts.ensure_installed = vim.tbl_filter(function(lang)
                if added[lang] then
                    return false
                end
                added[lang] = true
                return true
            end, opts.ensure_installed)
        end
        require("nvim-treesitter.configs").setup(opts)

        if load_textobjects then
            -- PERF: no need to load the plugin, if we only need its queries for mini.ai
            if opts.textobjects then
                for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
                    if opts.textobjects[mod] and opts.textobjects[mod].enable then
                        local Loader = require("lazy.core.loader")
                        Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
                        local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
                        require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
                        break
                    end
                end
            end
        end
    end,
}
