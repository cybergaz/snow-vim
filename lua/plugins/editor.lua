-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim

return {

  ----------------------------------------------------------------------------------------
  -- telescope keymaps fixations
  ----------------------------------------------------------------------------------------
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>/", false },
      { "<leader>:", false },
      { "<leader><space>", false },
      { "<leader>fb", false },
      { "<leader>fr", false },
      { "<leader>gc", false },
      { "<leader>gs", false },
      { "<leader>sa", false },
      { "<leader>sb", false },
      { "<leader>sb", false },
      { "<leader>sc", false },
      { "<leader>sC", false },
      { "<leader>sd", false },
      { "<leader>sg", false },
      { "<leader>sG", false },
      { "<leader>sh", false },
      { "<leader>sH", false },
      { "<leader>sk", false },
      { "<leader>sM", false },
      { "<leader>sm", false },
      { "<leader>so", false },
      { "<leader>sR", false },
      { "<leader>sw", false },
      { "<leader>sW", false },
      { "<leader>uC", false },
      { "<leader>ss", false },
      { "<leader>sS", false },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "marks" },
    },

    -- change some positions options
    -- opts = {
    --   defaults = {
    --     layout_strategy = "horizontal",
    --     layout_config = { prompt_position = "top" },
    --     sorting_strategy = "ascending",
    --     winblend = 0,
    --   },
    -- },

    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    -- require("telescope").setup({
    --   extensions = {
    --     file_browser = {
    --       -- theme = "ivy",
    --       -- disables netrw and use telescope-file-browser in its place
    --       hijack_netrw = true,
    --       mappings = {
    --         ["i"] = {},
    --         ["n"] = {
    --           -- your custom normal mode mappings
    --         },
    --       },
    --     },
    --   },
    -- }),
    -- require("telescope").load_extension("file_browser"),
  },

  ----------------------------------------------------------------------------------------
  -- neo tree annoying keymaps disabled
  ----------------------------------------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        { "<leader>ee", "<cmd>Neotree float<cr>", desc = "neo tree float" },
      }
    end,
  },

  ----------------------------------------------------------------------------------------
  -- harpoon file navigation
  ----------------------------------------------------------------------------------------
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      { "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove harpoon marks" },
      { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
      { "<S-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      -- { "<C-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      { "<S-h>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
      { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoon file 1" },
      { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoon file 2" },
      { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoon file 3" },
      { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "harpoon file 4" },
      { "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "harpoon file 5" },
    },
  },

  ----------------------------------------------------------------------------------------
  -- vim surround ( insert quotes/braces for a motion ysiw"/yss)/cs"'/etc... )
  ----------------------------------------------------------------------------------------
  {
    "tpope/vim-surround",
  },

  ----------------------------------------------------------------------------------------
  -- hex rgb colorcoding (highlight hex colors wherever used)
  ----------------------------------------------------------------------------------------
  {
    "norcalli/nvim-colorizer.lua",
  },
}
