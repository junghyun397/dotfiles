-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('config-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("color-column-by-lsp", { clear = true }),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local bufnr = ev.buf
    local ft = vim.bo[bufnr].filetype

    local columns_by_ft = {
      lua = "100",
      python = "88",
      rust = "100",
      go = "100",
      javascript = "100",
      typescript = "100",
      markdown = "80",
    }

    local columns_by_lsp = {
      lua_ls = "100",
      pyright = "88",
      rust_analyzer = "100",
      gopls = "100",
      ts_ls = "100",
    }

    local col =
      columns_by_lsp[client.name]
      or columns_by_ft[ft]
      or ""

    vim.api.nvim_set_option_value("colorcolumn", col, {
      scope = "local",
      win = 0,
    })
  end,
})

