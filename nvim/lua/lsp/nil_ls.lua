return {
  'nil_ls',
  lsp = {
    cmd = { 'nil', '--stdio' },
    filetypes = { 'nix' },
    root_markers = { 'flake.nix', '.git' },
    settings = { nix = { flake = { enable = true } } },
  },
}
