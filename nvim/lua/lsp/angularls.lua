return {
  'angularls',
  lsp = {
    cmd = { 'angular-language-server' },
    root_dir = require('lspconfig.util').root_pattern('angular.json'),
  },
}
