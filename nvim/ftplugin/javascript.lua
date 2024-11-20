local navic = require('nvim-navic')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').ts_ls.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end,
  capabilities = capabilities,
}
vim.cmd('LspStart')
