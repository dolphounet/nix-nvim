require('lze').register_handlers(require('lzextras').lsp)
require('lze').load {
  -- global LSPdefaults (optional)
  {
    'nvim-lspconfig',
    lsp = function(plugin)
      -- plugin.name = e.g. "angularls" or "nil_ls"
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
    before = function(plugin)
      vim.lsp.config('*', {
        on_attach = function(client, bufnr)
          local nmap = function(keys, fn, desc)
            if desc then
              desc = 'LSP: ' .. desc
            end
            vim.keymap.set('n', keys, fn, { buffer = bufnr, desc = desc })
          end
          nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          -- … more common keymaps …
        end,
      })
    end,
  },
  { import = 'lsp.angularls' },
  { import = 'lsp.nil_ls' },
  { import = 'lsp.clangd' },
  { import = 'lsp.lua_ls' },
  { import = 'lsp.jsonls' },
  { import = 'lsp.cssls' },
  { import = 'lsp.html' },
  { import = 'lsp.basedpyright' },
  { import = 'lsp.omnisharp' },
}
