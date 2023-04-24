require('my.keymap.alias')

-- f-keys
map('<F2>', ':NvimTreeToggle<CR>')
map('<S-F2>', ':NvimTreeFindFileToggle<CR>')

map('<S-Left>', ':bprevious<CR>')
map('<S-Right>', ':bnext<CR>')


-- map('[', ':LspPreviousReference<CR>')
-- map(']', ':LspNextReference<CR>')
-- map('<F12>', ':LspDefinition<CR>')
-- 
-- map('{', ':LspPreviousDiagnostic<CR>')
-- map('}', ':LspNextDiagnostic<CR>')

-- other

nmap('<Leader><space>', ':nohlsearch<CR>')

map('<Leader>w', ':set wrap!<CR>')
map('<Leader>n', ':set number!<CR>')
map('<Leader>p', ':set paste!<CR>')

map('<Tab>', '>>')
map('<S-Tab>', '<<')
