return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.statusline').setup()
    require('mini.surround').setup()
    require('mini.pairs').setup()
  end,
}

