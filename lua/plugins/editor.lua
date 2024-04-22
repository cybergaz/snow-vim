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
      { "<leader>ff", "<cmd> Telescope find_files <cr>", desc = "Find Files" },
      { "<leader>fl", "<cmd> Telescope find_files <cr>", desc = "Find Files" },
      -- { "<leader>fe", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
      { "<leader>fg", "<cmd> Telescope live_grep <cr>", desc = "Find Word (Live grep)" },
      { "<leader>fm", "<cmd> Telescope marks <cr>", desc = "Find Marks" },
      { "<leader>fk", "<cmd> Telescope keymaps <cr>", desc = "Find Keymaps" },
      { "<leader>fb", "<cmd> Telescope buffers <cr>", desc = "Find Buffers" },
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
    branch = "harpoon2",
    config = true,
    opts = function(_)
      require("harpoon"):setup({
        settings = {
          save_on_toggle = true,
          sync_on_ui_close = false,
        },
      })
    end,

    keys = {
      {
        "<leader>hh",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Mark file with harpoon",
      },
      {
        "<leader>hr",
        function()
          require("harpoon"):list():remove()
        end,
        desc = "Remove harpoon marks",
      },
      {
        "<leader>hl",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        desc = "Harpoon List",
      },
      {
        "<S-h>",
        function()
          require("harpoon"):list():prev({ ui_nav_wrap = true })
        end,
      },
      {
        "<S-l>",
        function()
          require("harpoon"):list():next({ ui_nav_wrap = true })
        end,
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "Switch to harpoon 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "Switch to harpoon 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "Switch to harpoon 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "Switch to harpoon 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "Switch to harpoon 5",
      },

      -- HARPOON 1 config
      --   { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      --   { "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      --   { "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove harpoon marks" },
      --   { "<leader>hl", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
      --   { "<S-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      --   -- { "<C-l>", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      --   { "<S-h>", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
      --   { "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoon file 1" },
      --   { "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoon file 2" },
      --   { "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoon file 3" },
      --   { "<leader>h4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "harpoon file 4" },
      --   { "<leader>h5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "harpoon file 5" },
    },
  },

  ----------------------------------------------------------------------------------------
  -- nvim surround ( insert quotes/braces for a motion ysiw"/yss)/cs"'/etc... )
  ----------------------------------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  ----------------------------------------------------------------------------------------
  -- hex rgb colorcoding (highlight hex colors wherever used)
  ----------------------------------------------------------------------------------------
  {
    "norcalli/nvim-colorizer.lua",
    cmd = { "ColorizerToggle", "ColorizerAttachToBuffer", "ColorizerReloadAllBuffers" },
  },

  -- vim-flog : more visually appealing git log
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
    keys = {
      { "<leader>gl", "<cmd>Flogsplit -all -graph<cr>", desc = "Git log (vim-flog)" },
    },
  },

  ----------------------------------------------------------------------------------------
  -- flash - jumping around with few keystrokes
  ----------------------------------------------------------------------------------------
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", false },
    { "<c-s>", false },
  },
  },
}
