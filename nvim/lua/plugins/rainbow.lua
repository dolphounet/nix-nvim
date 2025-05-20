return {
  'rainbow-delimiters.nvim',
  -- event = 'VimEnter',
  -- WARN: lazy = false prevents plugin not working if opening like nvim file.lua
  lazy = false,
  after = function()
    require('rainbow-delimiters.setup').setup {}
  end,
}
