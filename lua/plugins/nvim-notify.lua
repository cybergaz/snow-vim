return {
    "rcarriga/nvim-notify",
    keys = {
        {
            "<leader>tn",
            function()
                require("notify").dismiss({ silent = true, pending = true })
            end,
            desc = "Dismiss All Notifications",
        },
    },
    opts = {
        stages = "fade_in_slide_out",
        render = "minimal", -- simple , default , minimal , compact
        timeout = 2000,
        max_height = function()
            return math.floor(vim.o.lines * 0.75)
        end,
        max_width = function()
            return math.floor(vim.o.columns * 0.75)
        end,
        on_open = function(win)
            vim.api.nvim_win_set_config(win, { zindex = 100 })
        end,
    },
    -- init = function()
    --   -- when noice is not enabled, install notify on VeryLazy
    --   if not LazyVim.has("noice.nvim") then
    --     LazyVim.on_very_lazy(function()
    --       vim.notify = require("notify")
    --     end)
    --   end
    -- end,
}
