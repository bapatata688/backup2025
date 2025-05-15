--return {
--  "marko-cerovac/material.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    require("material").setup({
--      contrast = {
--        terminal = true,
--        floating_windows = true,
--        cursor_line = true,
--        non_current_windows = false,
--      },
--      plugins = {
--        "neo-tree",
--        "telescope",
--        "gitsigns",
--        "nvim-cmp",
--      },
--      disable = {
--        background = true,
--      },
--    })
--    vim.g.material_style = "darker"
--    vim.cmd.colorscheme("material")
--  end,
--}

--return {
--  "sainnhe/gruvbox-material",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    vim.g.gruvbox_material_background = "hard"
--    vim.g.gruvbox_material_foreground = "original"
--    vim.g.gruvbox_material_enable_italic = 1
--    vim.g.gruvbox_material_transparent_background = 1
--    vim.cmd.colorscheme("gruvbox-material")
--  end,
--}

--return {
--  "sainnhe/everforest",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    vim.g.everforest_background = "hard" -- más contraste
--    vim.g.everforest_enable_italic = 1
--    vim.g.everforest_transparent_background = 1
--    vim.cmd.colorscheme("everforest")
--  end,
--}

return {
  "rose-pine/neovim",
  name = "rose-pine",
  lazy = false,
  priority = 1000,
  config = function()
    require("rose-pine").setup({
      variant = "main", -- o "moon" o "dawn"
      dark_variant = "main",
      disable_background = true,
      disable_float_background = true,
      bold_vert_split = false,
    })
    vim.cmd.colorscheme("rose-pine")
  end,
}
--
--return {
--  "catppuccin/nvim",
--  name = "catppuccin",
--  priority = 1000,
--  lazy = false,
--  opts = {
--    flavour = "mocha",
--    transparent_background = true,
--    integrations = {
--      neotree = true,
--      treesitter = true,
--      native_lsp = { enabled = true },
--      cmp = true,
--      telescope = true,
--      dashboard = true,
--      which_key = true,
--    },
--  },
--  config = function(_, opts)
--    require("catppuccin").setup(opts)
--    vim.cmd.colorscheme("catppuccin")
--  end,
--}

--return {
--  "Mofiqul/dracula.nvim",
--  lazy = false,
--  priority = 1000,
--  config = function()
--    require("dracula").setup({
--      transparent_bg = true, -- activa transparencia
--      italic_comment = true,
--    })
--    vim.cmd.colorscheme("dracula")
--  end,
--}
--old colorscheme

--return {
--  "folke/tokyonight.nvim",
--  lazy = false,
--  priority = 1000,
--  opts = {
--    style = "night",
--    transparent = true,
--    terminal_colors = true,
--    styles = {
--      sidebars = "transparent",
--      floats = "transparent",
--    },
--  },
--  config = function(_, opts)
--    require("tokyonight").setup(opts)
--    vim.cmd.colorscheme("tokyonight")
--  end,
--}
