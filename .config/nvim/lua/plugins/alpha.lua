return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local fn = vim.fn

    -- 🟣 Header estilo gótico
    dashboard.section.header.val = {
      "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
      "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
      "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
      "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
      "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
      "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
      "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
      " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
      " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
      "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
      "  𝖈 𝖔 𝖉 𝖎 𝖓 𝖌  / 𝖍 𝖆 𝖈  𝓴  𝖎 𝖓 𝖌   ",
    }
    dashboard.section.header.opts = {
      position = "center",
      hl = "AlphaHeader",
    }

    -- 🔴 Botones estilo gótico
    dashboard.section.buttons.val = {
      dashboard.button("n", "  𝕹𝖊𝖜 𝖋𝖎𝖑𝖊𝖘", ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "󰈞  𝕱𝖎𝖓𝖉 𝖋𝖎𝖑𝖊𝖘", ":Telescope find_files<CR>"),
      dashboard.button("r", "  𝕽𝖊𝖈𝖊𝖓𝖙 𝖋𝖎𝖑𝖊𝖘", ":Telescope oldfiles<CR>"),
      dashboard.button(
        "s",
        "  𝕽𝖊𝖘𝖙𝖔𝖗𝖊 𝖘𝖊𝖘𝖘𝖎𝖔𝖓 ",
        [[<cmd>lua require("persistence").load()<cr>]]
      ),
      --dashboard.button("𝖃", "  𝕷𝖆𝖟𝖞 𝖊𝖝𝖙𝖗𝖆𝖘", ":LazyExtras<CR>"),
      dashboard.button("l", "󰒲  𝕷𝖆𝖟𝖞 ", ":Lazy<CR>"),
      -- dashboard.button("𝕮", "  𝕮𝖔𝖓𝖋𝖎𝖌𝖚𝖗𝖆𝖙𝖎𝖔𝖓 ", ":e $MYVIMRC<CR>"),
      -- dashboard.button("q", "  Salir", ":qa<CR>"),
    }
    --    dashboard.section.buttons.opts = {
    --      position = "center",
    --      hl = "AlphaButtons",
    --    }

    -- 🔵 Footer con fortune a la derecha
    local has_fortune, fortune = pcall(require, "alpha.fortune")
    if has_fortune then
      local lines = fortune()
      local win_width = fn.winwidth(0)
      for i, line in ipairs(lines) do
        lines[i] = string.rep(" ", math.max(0, win_width - #line - 5)) .. line
      end
      dashboard.section.footer.val = lines
      dashboard.section.footer.opts = {
        position = "center",
        hl = "AlphaFooter",
      }
    end

    --  dashboard.config.layout = {
    --    { type = "padding", val = 3 },
    --    dashboard.section.header,
    --    { type = "padding", val = 2 },
    --    dashboard.section.buttons,
    --    { type = "padding", val = 2 },
    --    dashboard.section.footer,
    --  }

    -- 🎨 Estilos góticos reales
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#5D1A37", bold = true }) -- púrpura oscuro

    --  vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#B22222", bold = true }) -- rojo sangre
    --   vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#B22222", bold = true }) -- rojo sangre
    vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#8D99AE", italic = true }) -- gris púrpura
    --    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#5A0A0A", bold = true }) -- rojo sangre oscuro
    -- vim.api.nvim_set_hl(0, "DashboardButton", { fg = "#8B0000", bold = true }) -- rojo oscuro gótico real

    -- Puedes seguir usando AlphaHeader y AlphaFooter como están definidos

    return dashboard.config
  end,
}
