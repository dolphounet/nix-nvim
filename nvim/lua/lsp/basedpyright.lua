return {
  'basedpyright',
  lsp = {
    filetypes = { 'python' },
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = 'workspace',
        },
      },
    },
  },
}
