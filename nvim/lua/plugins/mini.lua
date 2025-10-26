return {
  'mini.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('mini.splitjoin').setup()
    require('mini.surround').setup()
    require('mini.icons').setup()
    require('mini.comment').setup()
    require('mini.move').setup()
    require('mini.ai').setup()
  end,
}
