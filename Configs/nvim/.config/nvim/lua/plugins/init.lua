return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
    config = function()
      local mason_registry = require "mason-registry"
      local codelldb = mason_registry.get_package "codelldb"
      local extension_path = codelldb:get_install_path() .. "/extension/"
      local codelldb_path = extension_path .. "adapter/codelldb"
      local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
      local cfg = require "rustaceanvim.config"

      vim.g.rustaceanvim = {
        dap = {
          adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      -- require("core.utils").load_mappings "dap"
      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      -- require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "html-lsp",
        "css-lsp",
        "prettierd",
        "typescript-language-server",
        "jdtls",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "csv",
        "dockerfile",
        "json",
        "javascript",
        "java",
        "kotlin",
        "groovy",
        "scala",
        "python",
        "rust",
        "bash",
        "xml",
        "yaml",
        "tmux",
        "solidity",
        "sql",
        "gitignore",
        "gitcommit",
        "gitattributes",
        "git_config",
        "git_config",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      auto_install = true,
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-jdtls",
  },
}
