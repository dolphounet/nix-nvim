return {
  'nvim-navic',
  dep_of = {
    'nvim-lspconfig',
    'lualine',
  },
  after = function()
    require('nvim-navic').setup {
      lsp = {
        auto_attach = true,
        preference = { 'typescript-tools' },
      },
      click = true,
      highlight = true,
    }
  end,
}
