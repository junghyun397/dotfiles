return {
  'nvim-mini/mini.nvim',
  config = function()
    require('mini.surround').setup()
    require('mini.statusline').setup()
  end,
}

