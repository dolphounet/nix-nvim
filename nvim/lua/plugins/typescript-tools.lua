return {
  'typescript-tools.nvim',
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  after = function()
    require('typescript-tools').setup {
      settings = {
        expose_as_code_actions = { 'all' },
      },
    }
  end,
}
