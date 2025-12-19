return {
  'leetcode.nvim',
  cmd = { 'Leet' },
  after = function()
    require('leetcode').setup {
      plugins = { non_standalone = true },
    }
  end,
}
