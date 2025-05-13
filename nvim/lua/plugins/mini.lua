return {
  'mini.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('mini.splitjoin').setup()
    require('mini.notify').setup()
    require('mini.surround').setup()
    require('mini.icons').setup()
    require('mini.comment').setup()
    require('mini.move').setup()
    require('mini.ai').setup()
    require('mini.pairs').setup()
  end,
}
