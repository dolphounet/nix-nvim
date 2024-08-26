if vim.g.did_load_null_ls_plugin then
  return
end
vim.g.did_load_null_ls_plugin = true

local null_ls = require'null-ls'

null_ls.setup{
    sources = {
        null_ls.builtins.code_actions.statix,
        null_ls.builtins.formatting.alejandra,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.diagnostics.checkmake
    }
}
