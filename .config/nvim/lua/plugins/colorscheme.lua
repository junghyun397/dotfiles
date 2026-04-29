local tokyonight = {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = { style = 'night' },
  config = function(_, opts)
    require('tokyonight').setup(opts)
    vim.cmd.colorscheme 'tokyonight'
  end,
}

local onedark = {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'warmer',
    }
    require('onedark').load()
  end,
}

local jetbrains = {
  'nickkadutskyi/jb.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- require("jb").setup({ transparent = true })
    vim.cmd.colorscheme 'jb'
  end,
}

return {
  jetbrains,
}
