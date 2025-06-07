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
        dashboard.button('p', '    Open Explorer', ':Oil<CR><C-p>'),
        dashboard.button('f', '󰈞    Find Files', ':lua Snacks.picker.files()<CR>'),
        dashboard.button('g', '󰥨    Workspace Fuzzy Grep', ':lua Snacks.picker.grep()<CR>'),
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
