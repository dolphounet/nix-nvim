return {
  'angularls',
  lsp = {
    cmd = { 'angular-language-server', '--stdio' },
    filetypes = { 'typescript', 'html', 'typescriptreact', 'typescript.tsx', 'htmlangular' },
    root_markers = { 'angular.json', 'nx.json' },
  },
}
