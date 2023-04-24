require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "pylsp" },
}

vim.lsp.set_log_level('debug')
