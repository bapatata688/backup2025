return {
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = {
          "css",
          "scss",
          "html",
          "javascript",
          "typescript",
          "lua",
          "python",
          "tmux",
          "json",
          "jsonc", -- Agregados para soporte de colores en estos archivos
        },
        user_default_options = {
          RGB = true, -- Activa `rgb(...)`
          RRGGBB = true, -- Activa `#RRGGBB`
          names = true, -- Activa nombres de colores (`red`, `blue`)
          RRGGBBAA = true, -- Activa `#RRGGBBAA`
          rgb_fn = true, -- Activa funciones `rgb(...)`
          hsl_fn = true, -- Activa `hsl(...)`
          css = true, -- Activa todos los formatos CSS
          css_fn = true, -- Activa funciones CSS como `rgba(...)`
        },
      })
    end,
  },
}
