return {
  {
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
      require('plugins.snacksFlavors.pickerKeymaps')
    end,
  },
  {
    -- Highlights and search for TODO like comments
    'todo-comments.nvim',
    dep_of = 'snacks.nvim',
    after = function()
      require('todo-comments').setup()
    end,
  },
}
