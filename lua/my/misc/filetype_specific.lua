vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern="qf",
        callback = require('my.keymap.main').set_quickfix
    }
)

vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern="json",
        callback = require('my.keymap.main').set_json_filetype
    }
)
