-- Setup plugins with simple configs. Complex configs go to their respective files.
require('nvim-web-devicons').setup {
  default = true;
}

require('lualine').setup {
  options = {
    theme = 'nord'
  }
}

require("nvim-tree").setup {
  filters = {
    dotfiles = true
  }
}

require('gitsigns').setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  ignore_install = { "phpdoc" },
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  indent = {
    enable = true
  },
}

require("mason").setup {
  ui = {
   icons = {
     package_installed = "✓",
     package_pending = "➜",
     package_uninstalled = "✗"
   },
   border = "rounded",
  },
}

require('cmp').setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig')['pylsp'].setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 88
        },
        mccabe = {
          threshold = 25
        },
        mypy = {
          enabled = false,
        },
      },
    },
  },
  capabilities = capabilities,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- vim.lsp.buf.formatting_sync()
          vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.stylua,
    require("null-ls").builtins.diagnostics.mypy,
    require("null-ls").builtins.formatting.black,
    require("null-ls").builtins.formatting.isort,
  },
  on_attach = on_attach,
})
