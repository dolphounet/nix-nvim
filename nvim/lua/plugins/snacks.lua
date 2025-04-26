return {
  "snacks.nvim",
  event = "UIEnter",
  after = function()
    require("snacks").setup {
      bigfile = { enabled = true },
      indent = { enabled = true },
      statuscolumn = { enabled = true },
    }
  end
}
