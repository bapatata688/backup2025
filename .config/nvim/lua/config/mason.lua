require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "tsserver", "pyright" }, -- agrega los servidores que quieres instalar automáticamente
  automatic_installation = true, -- instala automáticamente si falta un servidor al abrir un archivo
  handlers = {
    -- Handler por defecto para configurar servidores LSP con lspconfig
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,
    -- Aquí puedes agregar configuraciones específicas para servidores concretos si quieres
    -- ejemplo:
    -- lua_ls = function()
    --   require("lspconfig").lua_ls.setup({ settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
    -- end,
  },
})
