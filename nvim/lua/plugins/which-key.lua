return {
  'which-key.nvim',
  priority = 100,
  after = function()
    require('which-key').setup {
      preset = 'helix',
    }
  end,
}
