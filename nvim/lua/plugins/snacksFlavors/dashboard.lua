local Snacks = require('snacks')

return {
  enabled = false,
  pane_gap = 4,
  width = 60,
  preset = {
    header = [[
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

    keys = {
      {
        icon = ' ',
        key = 'f',
        desc = 'Find File',
        action = function()
          Snacks.picker.smart()
        end,
      },
      { icon = ' ', key = 'n', desc = 'Open Oil', action = '<C-n>' },
      {
        icon = ' ',
        key = 'g',
        desc = 'Find Text',
        action = function()
          Snacks.picker.grep()
        end,
      },
      {
        icon = ' ',
        key = 'r',
        desc = 'Recent Files',
        action = function()
          Snacks.picker.recent()
        end,
      },
      { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
    },
  },

  sections = {
    { section = 'header' },
    { section = 'keys', gap = 2, padding = 1 },
  },
}
