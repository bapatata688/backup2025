return {
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
      require("neoscroll").setup({
        mappings = {
          "<C-u>", -- Scroll arriba
          "<C-d>", -- Scroll abajo
          "<C-b>", -- Página arriba
          "<C-f>", -- Página abajo
          "zt", -- Scroll hasta el tope
          "zz", -- Scroll centrado
          "zb", -- Scroll hasta el fondo
        },
        easing_function = "quadratic", -- Suaviza la animación
        hide_cursor = false, -- Mantiene el cursor visible mientras se desplaza
        stop_eof = true, -- Evita que el scroll sobrepase el final del archivo
      })

      if vim.fn.maparg("<C-Y>", "n") ~= "" then
        vim.keymap.del("n", "<C-Y>")
      end
    end,
  },
}
