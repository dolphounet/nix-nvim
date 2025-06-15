return {
  'qmlls',
  lsp = {
    cmd = { 'qmlls', '-E' },
    filetypes = { 'qml', 'qmljs' },
    root_markers = { '.git', 'flake.nix' },
  },
}
