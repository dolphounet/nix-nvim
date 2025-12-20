return {
  'leetcode.nvim',
  cmd = { 'Leet' },
  after = function()
    require('leetcode').setup {
      plugins = { non_standalone = true },
      lang = 'rust',

      injector = {
        ['rust'] = {
          before = { '#[allow(dead_code)]', 'fn main(){}', '#[allow(dead_code)]', 'struct Solution;' },
        }, ---@type table<lc.lang, lc.inject>
      },
      hooks = {
        ---@type fun(question: lc.ui.Question)[]
        ['question_enter'] = {
          function()
            local file_extension = vim.fn.expand('%:e')
            if file_extension == 'rs' then
              local target_dir = vim.fn.stdpath('data') .. '/leetcode'
              local output_file = target_dir .. '/rust-project.json'

              if vim.fn.isdirectory(target_dir) == 1 then
                local crates = ''
                local next = ''

                local rs_files = vim.fn.globpath(target_dir, '*.rs', false, true)
                for _, f in ipairs(rs_files) do
                  local file_path = f
                  crates = crates .. next .. '{"root_module": "' .. file_path .. '","edition": "2021","deps": []}'
                  next = ','
                end

                if crates == '' then
                  print('No .rs files found in directory: ' .. target_dir)
                  return
                end

                local sysroot_src = vim.fn.system('rustc --print sysroot'):gsub('\n', '')
                  .. '/lib/rustlib/src/rust/library'

                local json_content = '{"sysroot_src": "' .. sysroot_src .. '", "crates": [' .. crates .. ']}'

                local file = io.open(output_file, 'w')
                if file then
                  file:write(json_content)
                  file:close()

                  local clients = vim.lsp.get_clients()
                  local rust_analyzer_attached = false
                  for _, client in ipairs(clients) do
                    if client.name == 'rust_analyzer' then
                      rust_analyzer_attached = true
                      break
                    end
                  end

                  if rust_analyzer_attached then
                    vim.cmd('LspRestart rust_analyzer')
                  end
                else
                  print('Failed to open file: ' .. output_file)
                end
              else
                print('Directory ' .. target_dir .. ' does not exist.')
              end
            end
          end,
        },
      },
    }
  end,
}
