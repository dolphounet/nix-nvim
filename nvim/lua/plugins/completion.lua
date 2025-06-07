return {
  {
    'blink.cmp',
    event = 'InsertEnter',
    after = function()
      require('blink.cmp').setup {
        keymap = {
          preset = 'default',
          ['<C-j>'] = { 'select_next' },
          ['<C-k>'] = { 'select_prev' },
          ['<C-CR>'] = { 'accept', 'fallback' },
          ['<C-e>'] = { 'show', 'hide' },
        },
        snippets = {
          preset = 'luasnip',
        },
        signature = { enabled = true },
        cmdline = {
          enabled = false,
        },
        completion = {
          keyword = {
            range = 'full',
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 150,
          },
          list = {
            selection = {
              auto_insert = false,
            },
          },
          menu = {
            scrollbar = false,
            draw = {
              components = {
                kind_icon = {
                  text = function(ctx)
                    local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                    return kind_icon
                  end,
                  -- (optional) use highlights from mini.icons
                  highlight = function(ctx)
                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                    return hl
                  end,
                },
                kind = {
                  -- (optional) use highlights from mini.icons
                  highlight = function(ctx)
                    local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                    return hl
                  end,
                },
              },
              columns = {
                { 'kind_icon' },
                { 'label', 'label_description', gap = 1 },
                { 'source_name' },
              },
              treesitter = { 'lsp' },
            },
          },
        },
        sources = {
          min_keyword_length = 2,
          default = { 'snippets', 'lsp', 'path', 'buffer', 'ripgrep' },
          providers = {
            path = {
              async = true,
            },
            ripgrep = {
              module = 'blink-ripgrep',
              name = 'Ripgrep',
              opts = {
                prefix_min_len = 3,
                context_size = 4,
                max_filesize = '1M',
                project_root_marker = {
                  '.git',
                  'flake.nix',
                  'uv.lock',
                },
              },
            },
          },
        },
      }
    end,
  },
  {
    'friendly-snippets',
    dep_of = { 'blink.cmp' },
  },
  {
    'luasnip',
    dep_of = { 'blink.cmp' },
    after = function()
      require('luasnip').filetype_extend('javascript', { 'html' })
      require('luasnip').filetype_extend('typescript', { 'html' })
      require('luasnip').filetype_extend('javascriptreact', { 'html' })
      require('luasnip').filetype_extend('typescriptreact', { 'html' })
      require('luasnip.loaders.from_vscode').lazy_load()
      require('luasnip.loaders.from_snipmate').load()
      require('luasnip.loaders.from_lua').load()
    end,
  },
  {
    'blink-ripgrep.nvim',
    dep_of = { 'blink.cmp' },
  },
}
