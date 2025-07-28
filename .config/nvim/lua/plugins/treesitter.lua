return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "haskell", -- Haskell
        "rust", -- Rust
        "python", -- Python
        "typescript", -- Typescript
        "tsx", -- TSX
        "kotlin", -- Koltin
        "lua", -- Lua
        "vim", -- vimscript
        "vimdoc", -- vim man
        "query", -- SQL
        "json", -- json
        "yaml", -- yaml
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },

      auto_install = true,

      sync_install = false,
    })
  end,
}

