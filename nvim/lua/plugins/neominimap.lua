return {
  'neominimap.nvim',
  lazy = false,
  before = function()
    vim.opt.sidescrolloff = 36
    vim.g.neominimap = {
      auto_enable = true,
      click = {
        enabled = true,
      },
    }
  end,
}
