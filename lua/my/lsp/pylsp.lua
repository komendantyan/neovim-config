-- Setup language servers.
local lspconfig = require('lspconfig')
local mykeymap = require('my.keymap.main')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  mykeymap.set_lsp(bufnr)
end


lspconfig.pylsp.setup {  -- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/lua/mason-lspconfig/server_configurations/pylsp/README.md
  on_attach = on_attach,
  capabilities = require("cmp_nvim_lsp").default_capabilities(),  -- Add additional capabilities supported by nvim-cmp
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          maxLineLength = 200
        },
        jedi = {
          extra_paths = {
          }
        }
      }
    }
  }
}
