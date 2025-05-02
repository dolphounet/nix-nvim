return {
  {
    'alpha-nvim',
    lazy = false,
    after = function()
      local alpha = require('alpha')
      local dashboard = require('alpha.themes.dashboard')
      dashboard.section.header.val = vim.split(
        [[

                   ██████╗ ██╗  ██╗
                  ██╔═══██╗██║  ██║
                  ██║   ██║███████║
                  ██║   ██║██╔══██║
                  ╚██████╔╝██║  ██║
                   ╚═════╝ ╚═╝  ╚═╝

  ██╗   ██╗ ██████╗ ██████╗ ███████╗██╗   ██╗██████╗
  ██║   ██║██╔═══██╗██╔══██╗██╔════╝██║   ██║██╔══██╗
  ██║   ╚═╝██║   ██║██║  ██║█████╗  ██║   ██║██████╔╝
  ██║      ██║   ██║██║  ██║██╔══╝  ██║   ██║██╔══██╗
  ███████╗ ╚██████╔╝██████╔╝███████╗╚██████╔╝██║  ██║
  ╚══════╝  ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝
]],
        '\n'
      )

      dashboard.section.buttons.val = {
        dashboard.button('n', '󰈮    New File', ':ene <BAR> startinsert <CR>'),
        dashboard.button('p', '    Open Explorer', ':Oil<CR>'),
        dashboard.button('SPC t p', '󰈞    Find Files'),
        dashboard.button('SPC t f', '󰥨    Workspace Fuzzy Grep'),
        dashboard.button('q', '    Quit Neovim', ':qa<CR>'),
      }

      alpha.setup(dashboard.opts)
    end,
  },
  {
    'alpha-dashboard',
    dep_of = { 'aplha-nvim' },
  },
}
