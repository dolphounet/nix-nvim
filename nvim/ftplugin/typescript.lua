local cmd = { 'angular-language-server', '--stdio' }

require('lspconfig').angularls.setup {
  cmd = cmd,
  on_new_config = function(new_config, new_root_dir)
    new_config.cmd = cmd
  end,
}
