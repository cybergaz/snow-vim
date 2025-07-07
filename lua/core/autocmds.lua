local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("general_" .. name, { clear = true })
end

-- disable copilot on startup because it's annoying
-- vim.cmd(":Copilot disable")

-- Disable New Line Comment
autocmd("BufEnter", {
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
    group = augroup("newline_comment"),
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    group = augroup("resize_splits"),
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- close some filetypes with <q>
autocmd("FileType", {
    group = augroup("close_with_q"),
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "notify",
        "qf",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- make it easier to close man-files when opened inline
autocmd("FileType", {
    group = augroup("man_unlisted"),
    pattern = { "man" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

-- wrap and check for spell in text filetypes
-- autocmd("FileType", {
--   group = augroup("wrap_spell"),
--   pattern = { "gitcommit", "markdown" },
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.spell = true
--   end,
-- })

-- Fix conceallevel for json files
-- autocmd({ "FileType" }, {
--   group = augroup("json_conceal"),
--   pattern = { "json", "jsonc", "json5" },
--   callback = function()
--     vim.opt_local.conceallevel = 0
--   end,
-- })

-- toggle relative line number in insert and normal modes
-- local augroup = vim.api.nvim_create_augroup("numbertoggle", {})
-- vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
--     pattern = "*",
--     group = augroup,
--     callback = function()
--         if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
--             vim.opt.relativenumber = true
--         end
--     end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
--     pattern = "*",
--     group = augroup,
--     callback = function()
--         if vim.o.nu then
--             vim.opt.relativenumber = false
--
--             vim.cmd("redraw")
--         end
--     end,
-- })

-- make it 2 space indent for vyloo projects only
vim.api.nvim_create_autocmd("BufReadPre", {
    callback = function()
        if string.find(vim.fn.expand("%:p"), "vyloo") then
            vim.opt.shiftwidth = 2
            vim.opt.tabstop = 2
            vim.opt.expandtab = true
        end
    end,
})

-- treat dash as part of a word in certain filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "html", "css", "javascriptreact", "typescriptreact" },
--     callback = function()
--         vim.opt_local.iskeyword:append("-")
--     end,
-- })
