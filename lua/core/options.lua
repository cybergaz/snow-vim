vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.autowrite = true -- Enable auto write
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.conceallevel = 2 -- hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = false -- Enable highlighting of the current line
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.inccommand = "nosplit" -- preview incremental substitute
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode "a" for all modes and "nvi" you're smart enough
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
-- opt.pumblend = 10 -- Popup blend (gore option)
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 5 -- self explanatory
opt.sidescrolloff = 8 -- self explanatory
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.termguicolors = true -- True color support
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.timeoutlen = 300 -- Lower than default (1000) to quickly trigger which-key
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 500 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.smoothscroll = true
-- opt.signcolumn = "number"

-- Set tab width
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true -- Use spaces instead of tabs

vim.diagnostic.config({
    float = { border = "rounded" },
})

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- opt.guicursor = {
--     "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
--     "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
--     "sm:block-blinkwait175-blinkoff150-blinkon175",
-- }
-- opt.guicursor = "n-v-c-sm:block,i-ci-ve:hor1,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
