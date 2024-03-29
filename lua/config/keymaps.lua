-- -- Keymaps are automatically loaded on the VeryLazy event
-- -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- -- Add any additional keymaps here
--
local keymap = vim.keymap
-- --local keymap = vim.api.nvim_set_keymap
-- local default_opts = { noremap = true, silent = true }

-- -- Leader key
vim.g.mapleader = " "

-- -- format
-- -- keymap.set( {mode} , {OnKey} ,{Action} )

-- remmaping ESC for easier accesss
keymap.set({ "i" }, "jk", "<ESC>", { silent = true })
keymap.set({ "i" }, "kj", "<ESC>", { silent = true })

-- -- do not yank with x and c
keymap.set("n", "x", '"_x')
keymap.set("n", "c", '"_c')

-- -- select all
keymap.set({ "i", "n" }, "<C-a>", "<ESC>ggVG")

-- tab and buffers
-- keymap.set({ "n" }, "<leader>tt", "<cmd>tabnew<cr>", { silent = true })
keymap.set({ "n" }, "<leader>ww", "<cmd>bdelete!<cr>", { silent = true })
keymap.set(
  { "i", "v", "n" },
  "<C-w>",
  "<cmd>lua require('harpoon.mark').rm_file()<cr><cmd>bdelete!<cr>",
  { silent = true }
)

-- arrow keys disable
-- keymap.set({ "i", "n", "v" }, "<Up>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n", "v" }, "<Down>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n", "v" }, "<Left>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n", "v" }, "<Right>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n" }, "<ESC>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>a')

-- operation on selected text
keymap.set({ "n", "v" }, "mm", ":'<,'>norm ")

-- code formatting using prettier and all
keymap.set("n", "==", ":lua vim.lsp.buf.format()<CR>")

-- save and sudo mode save
-- keymap.set("n", "<c-s>", ":w !sudo tee % /dev/null")

-- keymap.set("n", "<CR>", "ciw")
keymap.set("n", "<BS>", 'ci"')

-- moving through buffers
keymap.set("n", "<A-h>", "<cmd> bprev<cr>")
keymap.set("n", "<A-l>", "<cmd> bnext<cr>")

-- lazy term (floating terminal)
local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
local map = Util.safe_keymap_set
map("n", "<leader>tt", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>T", function()
  Util.terminal()
end, { desc = "Terminal (cwd)" })

-- do not yank with visual paste ( alternatively you can always use capital P)
-- keymap.set("x", "p", function()
--   return 'pgv"' .. vim.v.register .. "y"
-- end, { remap = false, expr = true })
