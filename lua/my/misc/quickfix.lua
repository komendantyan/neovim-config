vim.api.nvim_create_autocmd(
    "FileType",
    {
        pattern="qf",
        callback = require('my.keymap.main').set_quickfix
    }
)
