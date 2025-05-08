return {
  'snacks.nvim',
  lazy = false,
  dep_of = 'neogit',
  after = function()
    require('snacks').setup {
      bigfile = { enabled = true },
      indent = { enabled = true },
      statuscolumn = { enabled = true },
      picker = { enabled = true },
      -- dashboard = { require('plugins.snacksFlavors.dashboard_not_me') },
    }
  end,
}
