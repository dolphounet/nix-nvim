return {
  {
    'nvim-dap',
    dep_of = { 'nvim-dap-ui', 'nvim-dap-virtual-text' },
    on_require = { 'dap' },
    keys = {
      { '<C-n>', '<CMD>Oil<CR><C-p>', desc = 'Open Oil' },
      {
        '<leader>bp',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'dap [b]reak[p]oint',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'dap [c]ontinue',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = 'dap step [i]nto',
      },
      {
        '<leader>do',
        function()
          require('dap').step_over()
        end,
        desc = 'dap step [o]ver',
      },
      {
        '<leader>dq',
        function()
          require('dap').terminate()
          require('dapui').close()
          require('nvim-dap-virtual-text').toggle()
        end,

        desc = 'dap [t]erminate',
      },
      {
        '<leader>du',
        function()
          require('dap').step_out()
        end,
        desc = 'dap step o[u]t',
      },
      {
        '<leader>dr',
        function()
          require('dap').restart()
        end,
        desc = 'dap [r]estart',
      },
      {
        '<leader>dp',
        function()
          require('dap').pause()
        end,
        desc = 'dap [p]ause',
      },
    },
    after = function()
      vim.fn.sign_define('DapBreakpoint', {
        text = '●', -- the glyph you want
        texthl = 'DiagnosticSignError', -- or e.g. "DiagnosticSignError"
        linehl = '',
        numhl = '',
      })
      vim.fn.sign_define('DapStopped', {
        text = '▶',
        texthl = 'Debug',
      })
    end,
  },
  {
    'nvim-nio',
    dep_of = { 'nvim-dap-ui' },
  },
  {
    'nvim-dap-ui',
    on_require = { 'dapui' },
    after = function()
      require('dapui').setup()
    end,
  },
  {
    'nvim-dap-virtual-text',
    on_plugin = { 'nvim-dap-ui' },
    after = function()
      require('nvim-dap-virtual-text').setup()
    end,
  },
}
