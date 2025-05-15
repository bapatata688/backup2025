return {
  "gbprod/yanky.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    ring = {
      history_length = 100,
      storage = "memory",
      sync_with_numbered_registers = true,
    },
    highlight = {
      on_put = true,
      on_yank = true,
      timer = 150,
    },
    picker = {
      telescope = {
        use_default_mappings = true,
      },
    },
  },
  config = function(_, opts)
    require("yanky").setup(opts)

    -- Integrar con Telescope
    require("telescope").load_extension("yank_history")

    local map = vim.keymap.set

    -- Mapeos básicos (reemplaza los nativos)
    map({ "n", "x" }, "y", "<Plug>(YankyYank)", { desc = "Yank mejorado" })
    map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)", { desc = "Pegar después" })
    map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)", { desc = "Pegar antes" })

    -- Ciclo de historial (estilo LazyVim)
    map("n", "[y", "<Plug>(YankyCycleForward)", { desc = "Yank anterior" })
    map("n", "]y", "<Plug>(YankyCycleBackward)", { desc = "Yank siguiente" })

    -- Mapeos adicionales útiles
    map("n", "gp", "<Plug>(YankyGPutAfter)", { desc = "Put después de selección" })
    map("n", "gP", "<Plug>(YankyGPutBefore)", { desc = "Put antes de selección" })

    -- Telescope
    map("n", "<leader>fy", "<cmd>Telescope yank_history<CR>", { desc = "Buscar yanks" })
  end,
}
