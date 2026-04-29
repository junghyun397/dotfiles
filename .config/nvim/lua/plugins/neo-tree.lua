local function lsp_root()
  local buf = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = buf })

  for _, client in ipairs(clients) do
    if client.config and client.config.root_dir then
      return client.config.root_dir
    end
  end

  return vim.fs.root(buf, ".git") or vim.uv.cwd()
end

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    keys = {
      {
        "<C-n>",
        function()
          require("neo-tree.command").execute({
            toggle = false,
            reveal = true,
            dir = lsp_root(),
          })
        end,
      },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        mappings = {
          ["o"] = "toggle_node",
          ["O"] = "expand_all_nodes",
          ["<esc>"] = function ()
            vim.cmd("wincmd p")
          end,
        },
      },
    },
  },
}

