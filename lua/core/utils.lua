local M = {}

function M.unsaved_buffers()
    local bufs = {}

    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if
            vim.api.nvim_buf_is_loaded(bufnr)
            and vim.bo[bufnr].modified
            and vim.bo[bufnr].buftype == ""
            and vim.api.nvim_buf_get_name(bufnr) ~= ""
        then
            table.insert(bufs, bufnr)
        end
    end

    return bufs
end

function M.unsaved_buffers_count()
    return #M.unsaved_buffers()
end

return M
