-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- vim.g.material_style = "deep ocean"
-- vim.notify = require("notify")
-- local notify = vim.notify
-- vim.notify = function(msg, ...)
--   if msg == "warning: multiple different client offset_encodings detected for buffer, this is not supported yet" then
--     return
--   end
--
--   notify(msg, ...)
-- end
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = "utf-8"
-- require("lspconfig").rust_analyzer.setup({
--   capabilities = capabilities,
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
--
-- require("lspconfig").rust_analyzer.setup({
--   capabilities = cmp_nvim_lsp.default_capabilities(),
--   cmd = {
--     "rust_analyzer",
--     "--offset-encoding=utf-8",
--   },
-- })
--

local cmp_nvim_lsp = require("cmp_nvim_lsp")

require("lspconfig").clangd.setup({
  on_attach = on_attach,
  capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
})
