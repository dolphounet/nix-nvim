local snacks = require('snacks')

local keymaps = {
  {
    'n',
    '<leader>st',
    function()
      snacks.picker.todo_comments { keywords = { 'TODO', 'FIX', 'FIXME' } }
    end,
    { desc = '[s]earch [t]odo comments' },
  },
  {
    'n',
    '<leader>ff',
    function()
      snacks.picker.smart()
    end,
    { desc = '[f]ind [f]iles' },
  },
  {
    'n',
    '<C-p>',
    function()
      snacks.picker.smart()
    end,
    { desc = '[f]ind [f]iles' },
  },
  {
    'n',
    '<leader>sp',
    function()
      snacks.picker.grep()
    end,
    { desc = 'grep [s]earch' },
  },
  {
    'n',
    '<leader>sb',
    function()
      snacks.picker.lines()
    end,
    { desc = '[s]earch current [b]uffer' },
  },
  {
    'n',
    '<C-S-F>',
    function()
      snacks.picker.grep_word()
    end,
    { desc = 'grep selection' },
  },
  {
    'n',
    '<leader>sd',
    function()
      snacks.picker.diagnostics_buffer()
    end,
    { desc = '[s]earch buffer [d]iagnostics' },
  },
  {
    'n',
    '<leader>sD',
    function()
      snacks.picker.diagnostics()
    end,
    { desc = '[s]earch project [D]iagnostics' },
  },
  {
    'n',
    '<leader>fr',
    function()
      snacks.picker.recent()
    end,
    { desc = '[f]ind [r]ecent files' },
  },
  {
    'n',
    'gd',
    function()
      snacks.picker.lsp_definitions()
    end,
    { desc = 'Goto [d]efinition' },
  },
  {
    'n',
    'gD',
    function()
      snacks.picker.lsp_declarations()
    end,
    { desc = 'Goto [D]eclaration' },
  },
  {
    'n',
    'gr',
    function()
      snacks.picker.lsp_references()
    end,
    {
      nowait = true,
      desc = 'References',
    },
  },
  {
    'n',
    'gI',
    function()
      snacks.picker.lsp_implementations()
    end,
    { desc = 'Goto [I]mplementation' },
  },
  {
    'n',
    'gy',
    function()
      snacks.picker.lsp_type_definitions()
    end,
    { desc = 'Goto T[y]pe Definition' },
  },
}

for _, map in ipairs(keymaps) do
  ---@diagnostic disable-next-line: deprecated (nvim's lua and luals' are different versions)
  vim.keymap.set(unpack(map))
end
