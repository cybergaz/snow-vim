-- -- Keymaps are automatically loaded on the VeryLazy event
-- -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- -- Add any additional keymaps here
--
local keymap = vim.keymap
-- --local keymap = vim.api.nvim_set_keymap
-- local default_opts = { noremap = true, silent = true }
--
-- -- Leader key
vim.g.mapleader = " "
--
-- -- format
-- -- keymap.set( {mode} , {OnKey} ,{Action} )
--
keymap.set({ "i" }, "jk", "<ESC>", { silent = true })
--
-- -- do not yank with x and c
keymap.set("n", "x", '"_x')
keymap.set("n", "c", '"_c')
--
-- -- select all
keymap.set({ "i", "n" }, "<C-a>", "<ESC>ggVG")

-- -- tab settings
-- keymap.set({ "n" }, "<leader>tt", "<cmd>tabnew<cr>", { silent = true })
keymap.set({ "n" }, "<leader>ww", "<cmd>bdelete!<cr>", { silent = true })
keymap.set({ "i", "v", "n" }, "<C-w>", "<cmd>bdelete!<cr>", { silent = true })

-- -- arrow keys disable
-- -- keymap.set({ "i", "n", "v" }, "<Up>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- -- keymap.set({ "i", "n", "v" }, "<Down>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- -- keymap.set({ "i", "n", "v" }, "<Left>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- -- keymap.set({ "i", "n", "v" }, "<Right>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n" }, "<ESC>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>a')

-- operation on selected text
keymap.set({ "n", "v" }, "mm", ":'<,'>norm ")

-- code formatting using prettier and all
keymap.set("n", "==", ":lua vim.lsp.buf.format()<CR>")

-- -- save and sudo mode save
-- keymap.set("n", "<c-s>", ":w !sudo tee % /dev/null")

-- keymap.set("n", "<CR>", "ciw")
keymap.set("n", "<BS>", 'ci"')
