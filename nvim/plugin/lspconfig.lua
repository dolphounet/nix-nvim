if vim.g.did_load_lspconfig_plugin then
  return
end
vim.g.did_load_lspconfig_plugin = true

local servers = { 'nil_ls', 'lua_ls', 'clangd', 'pyright', 'tsserver', 'jsonls', 'html', 'cssls', 'glsl_analyzer' }
local navic = require('nvim-navic')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
    end,
    capabilities = capabilities,
  }
end
