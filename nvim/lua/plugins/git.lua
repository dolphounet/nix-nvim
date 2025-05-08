return {
  {
    'diffview.nvim',
    dep_of = 'neogit',
  },
  {
    'neogit',
    keys = {
      { '<leader>co', '<cmd>Neogit commit<CR>', desc = 'neogit [co]mmit' },
      { '<leader>go', '<cmd>Neogit<CR>',        desc = 'neo[g]it [o]pen' },

      { '<leader>di', '<cmd>Neogit diff<CR>',   desc = 'neogit [di]ff' },
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
