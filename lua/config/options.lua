-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.hlsearch = true

-- vim.opt.shiftwidth = 4
-- vim.opt.tabstop = 4

vim.diagnostic.config({
  float = { border = "rounded" },
})

-- vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:hor1,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
