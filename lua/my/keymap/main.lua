function set_global()
  -- f-keys
  local function map(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, {noremap=true, silent=true}) end
  map('<F2>', ':NvimTreeToggle<CR>')
  map('<S-F2>', ':NvimTreeFindFileToggle!<CR>')

  map('<S-Left>', ':bprevious<CR>')
  map('<S-Right>', ':bnext<CR>')

  map('<Leader><space>', ':nohlsearch<CR>')

  map('<Leader>w', ':set wrap!<CR>')
  map('<Leader>n', ':set number!<CR>')
  map('<Leader>p', ':set paste!<CR>')

  map('<Tab>', '>>')
  map('<S-Tab>', '<<')

  map('<C-P>', ':Telescope commands<CR>')
end

function set_lsp(bufnr)
  local function buf_callback(lhs, callback)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, '', {noremap=true, silent=true, callback=callback})
  end

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_callback('gD', vim.lsp.buf.declaration)
  buf_callback('gd', vim.lsp.buf.definition)
  buf_callback('K', vim.lsp.buf.hover)
  buf_callback('gi', vim.lsp.buf.implementation)
  buf_callback('<C-k>', vim.lsp.buf.signature_help)
  buf_callback('<space>wa', vim.lsp.buf.add_workspace_folder)
  buf_callback('<space>wr', vim.lsp.buf.remove_workspace_folder)
  buf_callback('<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)
  buf_callback('<space>D', vim.lsp.buf.type_definition)
  buf_callback('<space>rn', vim.lsp.buf.rename)
  buf_callback('<space>ca', vim.lsp.buf.code_action)
  buf_callback('gr', vim.lsp.buf.references)
  buf_callback('<space>e', vim.diagnostic.open_float)
  buf_callback('[d', vim.diagnostic.goto_prev)
  buf_callback(']d', vim.diagnostic.goto_next)
  buf_callback('<space>q', vim.diagnostic.setloclist)
  buf_callback('<space>f', vim.lsp.buf.formatting)

  buf_callback('<F12>', vim.lsp.buf.definition)
  buf_callback('<S-F12>', vim.lsp.buf.references)
end

function set_quickfix()
  local function map(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, {noremap=true, silent=true}) end

  map('q', ':quit<CR>')
end


return {
    set_global = set_global,
    set_lsp = set_lsp,
    set_quickfix = set_quickfix,
}
