local _map = vim.api.nvim_set_keymap


function map(key, command)
    _map('', key, command, {noremap = true})
end

function nmap(key, command)
    _map('n', key, command, {noremap = true})
end

function imap(key, command)
    _map('i', key, command, {noremap = true})
end


function vmap(key, command)
    _map('v', key, command, {noremap = true})
end

function tmap(key, command)
    _map('t', key, command, {noremap = true})
end
