require('flutter-tools').setup {}
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
    vim.lsp.buf.format { async = false }
  end,
})
