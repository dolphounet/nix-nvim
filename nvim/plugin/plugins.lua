-- many plugins annoyingly require a call to a 'setup' function to be loaded,
-- even with default configs
require('lsp')
require('plugins')

require('nvim-surround').setup()
require('rainbow-delimiters.setup').setup()
