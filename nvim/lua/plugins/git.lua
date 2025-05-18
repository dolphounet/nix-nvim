return {
  {
    'diffview.nvim',
    dep_of = 'neogit',
  },
  {
    'neogit',
    keys = {
      { '<leader>gc', '<cmd>Neogit commit<CR>', desc = 'neo[g]it commit' },
      { '<leader>go', '<cmd>Neogit<CR>', desc = 'neo[g]it [o]pen' },

      { '<leader>gd', '<cmd>Neogit diff<CR>', desc = 'neo[g]it [d]iff' },
    },
    after = function() end,
    require('neogit').setup {
      disable_builtin_notifications = true,
      disable_insert_on_commit = 'auto',
      integrations = {
        diffview = true,
        snacks = true,
      },
      sections = {
        ---@diagnostic disable-next-line: missing-fields
        recent = {
          folded = false,
        },
      },
    },
  },
}
