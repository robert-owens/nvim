-- LSP plugins
return {
-- Mason - Package manager for LSP servers
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "typescript-language-server",
        "pyright",
        "rust-analyzer",
        -- Add other LSPs you need
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- Mason-lspconfig bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    opts = {
      automatic_installation = true,
    },
  },

  -- Your existing conform.nvim config...
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        mojo = { "mojo" },
      },
      formatters = {
        mojo = {
          command = "mojo",
          args = { "format", "-" },
          stdin = true,
        },
      },
    },
  },
  {
  "neovim/nvim-lspconfig",
  dependencies = { "mason.nvim", "mason-lspconfig.nvim" },
  opts = {
    servers = {
      -- Mojo LSP server
      mojo = {
        cmd = { "mojo-lsp-server" },
        filetypes = { "mojo" },
        root_dir = function(fname)
          return require("lspconfig.util").find_git_ancestor(fname) or vim.fn.getcwd()
        end,
        settings = {},
      },
    },
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")

    -- Setup each server
    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(config)
    end
  end,
},
}
