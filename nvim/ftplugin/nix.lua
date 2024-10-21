-- Exit if the language server isn't available
if vim.fn.executable('nil') ~= 1 then
  return
end
local navic = require('nvim-navic')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').nil_ls.setup {
  on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end,
  capabilities = capabilities,
}
-- local root_files = {
--   'flake.nix',
--   'default.nix',
--   'shell.nix',
--   '.git',
-- }
--
-- vim.lsp.start {
--   name = 'nil_ls',
--   cmd = { 'nil' },
--   root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
--   capabilities = require('user.lsp').make_client_capabilities(),
-- }
