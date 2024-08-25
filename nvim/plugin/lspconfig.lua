if vim.g.did_load_lspconfig_plugin then
  return
end
vim.g.did_load_lspconfig_plugin = true

local servers = {'nil_ls', 'lua_ls'}

for _, lsp in ipairs(servers) do
    require'lspconfig'[lsp].setup{}
end


