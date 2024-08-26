if vim.g.did_load_lspconfig_plugin then
  return
end
vim.g.did_load_lspconfig_plugin = true

local servers = {'nil_ls', 'lua_ls', 'clangd', 'pyright', 'tsserver', 'jsonls', 'html', 'cssls', 'glsl_analyzer'}

for _, lsp in ipairs(servers) do
    require'lspconfig'[lsp].setup{}
end


