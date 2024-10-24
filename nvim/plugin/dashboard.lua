local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = vim.split(
  [[



████████╗ ██████╗ ███╗   ███╗██╗███████╗     █████╗
╚══██╔══╝██╔═══██╗████╗ ████║██║██╔════╝    ██╔══██╗
   ██║   ██║   ██║██╔████╔██║╚═╝███████╗    ███████║
   ██║   ██║   ██║██║╚██╔╝██║   ╚════██║    ██╔══██║
   ██║   ╚██████╔╝██║ ╚═╝ ██║   ███████║    ██║  ██║
   ╚═╝    ╚═════╝ ╚═╝     ╚═╝   ╚══════╝    ╚═╝  ╚═╝

    ██████╗ ███████╗███╗   ██╗██╗██╗   ██╗███████╗
   ██╔════╝ ██╔════╝████╗  ██║██║██║   ██║██╔════╝
   ██║  ███╗█████╗  ██╔██╗ ██║██║██║   ██║███████╗
   ██║   ██║██╔══╝  ██║╚██╗██║██║██║   ██║╚════██║
   ╚██████╔╝███████╗██║ ╚████║██║╚██████╔╝███████║
    ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚══════╝


]],
  '\n'
)

dashboard.section.buttons.val = {
  dashboard.button('<C-n> a', '󰈮    New File'),
  dashboard.button('SPC t p', '󰈞    Find Files'),
  dashboard.button('SPC t f', '󰥨    Workspace Fuzzy Grep'),
  dashboard.button(':qa', '    Quit Neovim'),
}

dashboard.section.footer.val = "Tom's really a genius tho"

alpha.setup(dashboard.opts)
