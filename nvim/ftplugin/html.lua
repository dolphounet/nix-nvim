local navic = require('nvim-navic')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').html.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end,
  capabilities = capabilities,
}
