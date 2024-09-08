local map = function(modes, lhs, rhs, opts)
    local options = { silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    if type(modes) == "string" then
        modes = { modes }
    end
    for _, mode in ipairs(modes) do
        vim.keymap.set(mode, lhs, rhs, options)
    end
end

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- do not yank with x, c, s
map({ "n", "x" }, "x", '"_x')
map({ "n" }, "X", '"_dd')
map({ "x" }, "X", '"_X')
map({ "n", "x" }, "c", '"_c')
map({ "n", "x" }, "C", '"_C')
map({ "x", "n" }, "s", '"_d')
map({ "n" }, "S", '"_S')
map({ "n" }, "xl", '"_dd')

-- do not yank with visual paste
map("x", "p", "P", { desc = "no yank on select-paste " })

-- REDO with U
map("n", "U", "<C-r>")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- select all
map({ "i", "n" }, "<C-a>", "<ESC>ggVG")

-- writing and quiting
map("n", "<leader>wo", "<cmd> wqa <cr>", { desc = "write and quit all" })
map({ "n" }, "<leader>wn", "<cmd> qa! <cr>", { desc = "quit all without saving" })
-- map({ "n", "i" }, "<C-s>", "<cmd> wqa <cr>")
-- map({ "n", "i" }, "<C-q>", "<cmd> qa! <cr>")

-- find and replace & quickfix
map({ "n" }, "?", ":%s/", { desc = "Find and replace in current file", silent = false })
map({ "n" }, "<leader>?", ":cdo s/", { desc = "Find and replace in quickfix list", silent = false })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next Quickfix" })
map("n", "[q", "<cmd>cprev<cr>", { desc = "Prev Quickfix" })

-- remapping % to 'tp'
map({ "n", "x", "o", "v" }, "tp", "%", { desc = "Teleport between braces" })

-- operation on selected lines
map({ "n", "v" }, "mm", ":'<,'>norm ", { desc = "Operation on selected lines", silent = false })

-- delete strings with backspace (require mini.ai)
map("n", "<BS>", '"_ci"')

-- Buffers
map("n", "<M-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<M-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>ww", "<cmd>bdelete!<cr>", { desc = "Delete Buffer" })
map("n", "<C-x>", "<cmd>bdelete!<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bc", function()
    local bufs = vim.api.nvim_list_bufs()
    local current_buf = vim.api.nvim_get_current_buf()
    for _, i in ipairs(bufs) do
        if i ~= current_buf then
            vim.api.nvim_buf_delete(i, {})
        end
    end
end, { desc = "Delete all but current buffer" })
-- map({ "i", "v", "n" }, "<C-w>", "<cmd>lua require('harpoon'):list():remove()<cr><cmd>bdelete!<cr>")

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- windows
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "delete window", remap = true })
map("n", "<leader>-", "<cmd>split<cr>", { desc = "split window below", remap = true })
map("n", "<leader>|", "<cmd>vsplit<cr>", { desc = "split window right", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Opposite behavior of n and N
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- sudo mode save
-- keymap.set("n", "<c-s>", ":w !sudo tee % /dev/null")

---------------------------------------------------------------------------------------------------------------------

-- stylua: ignore start

-- lazy
map("n", "<leader>llll", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- diagnostic
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })

-- Code/LSP
map("n", "<leader>cl", "<cmd>LspInfo<cr>", { desc = "LSP Info" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, { desc = "Goto Definition" })
map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Goto References" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" })
map("n", "gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, { desc = "Goto Implementation" })
map("n", "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, { desc = "Goto Type Definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })

-- toggle inlay hints
map( "n", "<leader>hi", "<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>", { desc = "Toggle Inlay Hints" })

-- stylua: ignore end

-- toggle options
map("n", "<leader>ud", function()
    if vim.diagnostic.is_enabled then
        enabled = vim.diagnostic.is_enabled()
    elseif vim.diagnostic.is_disabled then
        enabled = not vim.diagnostic.is_disabled()
    end
    enabled = not enabled

    if enabled then
        vim.diagnostic.enable()
        require("notify")("Diagnostics Enabled", "info", { title = "Diagnostics" })
    else
        vim.diagnostic.enable(false)
        require("notify")("Diagnostics Disabled", "info", { title = "Diagnostics" })
    end
end, { desc = "Toggle diagnostics" })
map("n", "<leader>us", function()
    vim.o.spell = not vim.o.spell
end, { desc = "Toggle spelling shecks" })
map("n", "<leader>uw", function()
    vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle word wrap" })
