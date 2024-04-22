-- -- Keymaps are automatically loaded on the VeryLazy event
-- -- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- -- Add any additional keymaps here

local keymap = vim.keymap

-- Leader key
vim.g.mapleader = " "

-- remmaping ESC for easier accesss
----------------------------------------------------------------
keymap.set({ "i" }, "jk", "<ESC>", { silent = true })
keymap.set({ "i" }, "kj", "<ESC>", { silent = true })
----------------------------------------------------------------

-- do not yank with x and c
----------------------------------------------------------------
keymap.set({ "n", "x" }, "x", '"_x')
keymap.set({ "n", "x" }, "c", '"_c')
keymap.set({ "n", "x" }, "C", '"_C')
keymap.set({ "x" }, "s", '"_d')
keymap.set({ "n" }, "s", '"_d')
keymap.set({ "n" }, "S", '"_S')
----------------------------------------------------------------

-- select all
----------------------------------------------------------------
keymap.set({ "i", "n" }, "<C-a>", "<ESC>ggVG")
----------------------------------------------------------------

-- find and replace
keymap.set({ "n" }, "<leader>fr", ":%s/", { desc = "Find and replace in current file" })

-- REDO with U
----------------------------------------------------------------
keymap.set("n", "U", "<C-r>", { silent = true })
----------------------------------------------------------------

-- Write Out binds
----------------------------------------------------------------
keymap.set("n", "<leader>wf", "<cmd> up <cr>", { silent = true })
keymap.set("n", "<leader>wo", "<cmd> wqa <cr>", { silent = true })
keymap.set({ "n", "i" }, "<C-s>", "<cmd> wqa <cr>", { silent = true })
----------------------------------------------------------------

-- Quit without saving
----------------------------------------------------------------
keymap.set({ "n", "i" }, "<C-q>", "<cmd> qa! <cr>", { silent = true })
keymap.set({ "n" }, "<leader>wn", "<cmd> qa! <cr>", { silent = true })
----------------------------------------------------------------

-- operation on selected text
----------------------------------------------------------------
keymap.set({ "n", "v" }, "mm", ":'<,'>norm ")
----------------------------------------------------------------

-- save and sudo mode save
----------------------------------------------------------------
-- keymap.set("n", "<c-s>", ":w !sudo tee % /dev/null")
----------------------------------------------------------------

-- delete strings with backspace
----------------------------------------------------------------
keymap.set("n", "<BS>", 'ci"')
-- keymap.set("n", "<CR>", "ciw")
----------------------------------------------------------------

-- disable arrow keys
----------------------------------------------------------------
-- keymap.set({ "i", "n", "v" }, "<Up>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n", "v" }, "<Down>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n", "v" }, "<Left>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n", "v" }, "<Right>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>')
-- keymap.set({ "i", "n" }, "<ESC>", '<ESC>:lua print "Na Vro Na , I can\'t let this happen"<CR>a')
----------------------------------------------------------------

-- buffers  ||  Harpoon
----------------------------------------------------------------
keymap.set("n", "<A-h>", "<cmd> bprev<cr>")
keymap.set("n", "<A-l>", "<cmd> bnext<cr>")

keymap.set({ "n" }, "<leader>ww", "<cmd>bdelete!<cr>", { silent = true })
keymap.set(
  { "i", "v", "n" },
  "<C-w>",
  "<cmd>lua require('harpoon'):list():remove()<cr><cmd>bdelete!<cr>",
  { silent = true }
)
----------------------------------------------------------------

-- lazy term (floating terminal)
----------------------------------------------------------------
local Util = require("lazyvim.util")
local lazyterm = function()
  Util.terminal(nil, { cwd = Util.root() })
end
local map = Util.safe_keymap_set
map("n", "<leader>tt", lazyterm, { desc = "Terminal (root dir)" })
map("n", "<leader>T", function()
  Util.terminal()
end, { desc = "Terminal (cwd)" })
----------------------------------------------------------------

-- do not yank with visual paste ( alternatively you can always use capital P)
----------------------------------------------------------------
-- keymap.set("x", "<leader>p", [["_dP]], { desc = "no yank on select-paste " })
keymap.set("x", "p", "P", { desc = "no yank on select-paste " })
-- keymap.set("x", "p", function()
--   return 'pgv"' .. vim.v.register .. "y"
-- end, { remap = false, expr = true })
----------------------------------------------------------------
