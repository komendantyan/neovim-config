require('my.packer')
require('my.common')

local keymap = require('my.keymap.main')
keymap.set_global()

local commands = require('my.commands.main')
commands.set_global()

require('my.lsp.pylsp')
require('my.lsp.lua_ls')

require('my.misc.filetype_specific')
