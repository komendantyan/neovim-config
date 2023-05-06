require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "pylsp", "lua_ls" },
}

vim.lsp.set_log_level('debug')
