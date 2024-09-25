if vim.g.did_load_luasnip_plugin then
  return
end
vim.g.did_load_luasnip_plugin = true

require('luasnip').filetype_extend('javascript', { 'html' })
require('luasnip').filetype_extend('javascriptreact', { 'html' })
require('luasnip').filetype_extend('typescriptreact', { 'html' })
require('luasnip.loaders.from_vscode').lazy_load()
