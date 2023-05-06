local M = {}

function MyCmdRename()
    vim.lsp.buf.rename()
end

function M.set_global()
    vim.api.nvim_create_user_command('MyCmdRename', MyCmdRename, {
        desc = "Refactoring: rename via LSP"
    })
end

return M
