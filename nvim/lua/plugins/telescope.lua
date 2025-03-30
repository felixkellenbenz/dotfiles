return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescopeBuiltin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>f', telescopeBuiltin.find_files, {})
    vim.keymap.set('n', '<leader>fg', telescopeBuiltin.live_grep, {})
  end
}
