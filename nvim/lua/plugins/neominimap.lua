return {
  'neominimap.nvim',
  lazy = false,
  before = function()
    vim.g.neominimap = {
      auto_enable = true,
      click = {
        enabled = true,
      },
    }
  end,
}
