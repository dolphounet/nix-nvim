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

        desc = 'dap [q]uit',
      },
      {
        '<leader>dt',
        function()
          require('dapui').toggle()
        end,
        desc = 'dapui [t]oggle',
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
      require('dapui').setup()

      local dap = require('dap')

      dap.adapters['pwa-node'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug',
          args = { '${port}' },
        },
      }
      dap.adapters['pwa-chrome'] = {
        type = 'server',
        host = 'localhost',
        port = '${port}',
        executable = {
          command = 'js-debug',
          args = { '${port}' },
        },
      }

      if not dap.adapters['node'] then
        dap.adapters['node'] = function(cb, config)
          if config.type == 'node' then
            config.type = 'pwa-node'
          end
          local nativeAdapter = dap.adapters['pwa-node']
          if type(nativeAdapter) == 'function' then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      if not dap.adapters['chrome'] then
        dap.adapters['chrome'] = function(cb, config)
          if config.type == 'chrome' then
            config.type = 'pwa-chrome'
          end
          local nativeAdapter = dap.adapters['pwa-chrome']
          if type(nativeAdapter) == 'function' then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      local js_filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' }

      local vscode = require('dap.ext.vscode')
      vscode.type_to_filetypes['node'] = js_filetypes

      vscode.type_to_filetypes['pwa-node'] = js_filetypes
      local current_file = vim.fn.expand('%:t')

      for _, language in ipairs(js_filetypes) do
        if not dap.configurations[language] then
          dap.configurations[language] = {
            {
              type = 'pwa-node',
              request = 'launch',
              name = 'Launch file',
              program = '${file}',
              cwd = '${workspaceFolder}',
            },
            {

              type = 'pwa-node',
              request = 'attach',
              name = 'Attach',
              processId = require('dap.utils').pick_process,
              cwd = '${workspaceFolder}',
            },
            {
              name = 'tsx (' .. current_file .. ')',
              type = 'node',
              request = 'launch',
              program = '${file}',
              runtimeExecutable = 'npx tsx',
              cwd = '${workspaceFolder}',
              console = 'integratedTerminal',
              internalConsoleOptions = 'neverOpen',
              skipFiles = { '<node_internals>/**', '${workspaceFolder}/node_modules/**' },
            },
          }
        end
      end
    end,
  },
  {
    'nvim-nio',
    dep_of = { 'nvim-dap-ui' },
  },
  {
    'nvim-dap-ui',
    on_require = { 'dapui' },
    dep_of = { 'nvim-dap' },
  },
  {
    'nvim-dap-virtual-text',
    on_plugin = { 'nvim-dap-ui' },
    after = function()
      require('nvim-dap-virtual-text').setup()
    end,
  },
}
