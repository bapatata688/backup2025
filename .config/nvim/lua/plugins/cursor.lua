return {
  "sphamba/smear-cursor.nvim",
  opts = {
    legacy_computing_symbols_support = true,
    cursor_color = "#c4a7e7", -- Un tono gótico, combina con tu paleta
    stiffness = 0.45, -- Más suave, más "líquido"
    trailing_stiffness = 0.35, -- Rastro más largo y fluido
    distance_stop_animating = 0.15, -- Animación más precisa
    gamma = 1.2, -- Curva más suave
    cursor_trail_length = 12, -- (Si está disponible) Rastro más largo
    cursor_trail_fade = 0.85, -- (Si está disponible) Desvanecimiento suave
  },
  config = function(_, opts)
    require("smear_cursor").setup(opts)

    -- Configura el estilo y parpadeo del cursor
    vim.opt.guicursor = table.concat({
      "n-v-c:block-Cursor",
      "i-ci-ve:ver25-Cursor",
      "r-cr:hor20-Cursor",
      "o:hor50-Cursor",
      "a:blinkwait600-blinkoff400-blinkon600",
      "sm:block-Cursor",
    }, ",")
    vim.api.nvim_set_hl(0, "Cursor", { bg = "#c4a7e7", fg = "#191724" })
  end,
}
