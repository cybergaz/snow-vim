return {
  -- vim surround
  {
    "tpope/vim-surround",
  },

  -- telescope file explorer
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    --
    -- a few keybinds to remember :
    -- Alt+c --> create file
    -- Alt+r --> rename
    -- Alt+d --> delete
    -- Ctrl+h --> toggle hidden
  },
  {
    "marko-cerovac/material.nvim",
  },
}
