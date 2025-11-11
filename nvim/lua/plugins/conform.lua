return {
  'conform.nvim',
  event = 'BufWritePre',
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'never' }
      end,
      mode = '',
      desc = '[f]ormat buffer',
    },
  },
  after = function()
    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(_)
        local lsp_format_opt = 'never'
        return {
          timeout_ms = 1500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        scss = { 'prettierd' },
        less = { 'prettierd' },
        python = { 'black' },
        nix = { 'nixfmt' },
        rust = { 'rustfmt' },
        java = { 'google-java-format' },
        sql = { 'sqlfmt' },
      },
    }
  end,
}
