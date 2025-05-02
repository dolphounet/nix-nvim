return {
  'oil.nvim',
  keys = {
    { '<C-p>', '<CMD>Oil<CR><C-p>',      desc = 'Open Oil' },
    { '<C-p>', '<ESC><CMD>Oil<CR><C-p>', mode = 'i',       desc = 'Open Oil' },
  },
  cmd = {
    'Oil',
  },
  after = function()
    require('oil').setup {
      watch_for_changes = true,
      view_options = {
        show_hidden = true,
      },
    }
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = vim.schedule_wrap(function(args)
        local oil = require('oil')
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.open_preview()
        end
      end),
    })
  end,
}
