return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",           -- Rust
        "pyright",                 -- Python
        "ts_ls",                   -- TypeScript / TSX
        "kotlin-language-server",  -- Kotlin
        "lua-language-server",     -- Lua
      },
    },
  },

  -- Mason-LSPConfig: Bridge between Mason and nvim-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "rust_analyzer", -- rust
        "pyright", -- python
        "kotlin_language_server", -- kotlin
        "lua_ls", -- lua
        "ts_ls", -- typescript
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      local capabilities = nil
      local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if status_ok then
        capabilities = cmp_nvim_lsp.default_capabilities()
      end

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  },
}

