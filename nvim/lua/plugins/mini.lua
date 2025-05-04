return {
  'mini.nvim',
  event = 'DeferredUIEnter',
  after = function()
    require('mini.hipatterns').setup {
      highlighters = {
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
      },
    }
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
