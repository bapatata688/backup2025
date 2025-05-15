return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = { winbar = false },
    window = { width = 30 },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
  end,
}
