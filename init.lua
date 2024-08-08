require("core.options")
require("core.autocmds")

-- Bootstrap Lazy Vim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- lazy plugin manager config
require("lazy").setup({
    spec = {
        { import = "plugins" },
    },

    defaults = {
        lazy = true,
        version = false,
    },

    install = {
        missing = true,
        colorscheme = { "default" },
    },

    checker = { enabled = false },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = false,
        notify = false, -- get a notification when changes are found
    },

    rocks = {
        enabled = false,
    },

    -- dev = {
    --     path = "~/git",
    --     fallback = true,
    -- },

    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tohtml",
                "zipPlugin",
                "netrwPlugin",
                "tutor",
            },
        },
    },

    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        wrap = true, -- wrap the lines in the ui
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
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
        -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
        backdrop = 60,
    },
})

require("core.keymaps")
