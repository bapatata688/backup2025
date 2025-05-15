return {
  {
    "tpope/vim-surround",
    config = function()
      vim.keymap.set("n", "gS", "ys", { remap = true, desc = "Surround with 'ys'" })
      vim.keymap.set("v", "gS", "S", { remap = true, desc = "Surround in visual mode" }) -- Envolver en visual
    end,
  },
}
