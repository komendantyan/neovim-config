local _STATE = {}

function set_global()
  -- f-keys
  local function map(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, {noremap=true, silent=true}) end


  local function map_callback(lhs, callback)
      vim.api.nvim_set_keymap('n', lhs, '', {noremap=true, silent=true, callback=callback})
  end

  map('<F2>', ':NvimTreeToggle<CR>')
  map('<S-F2>', ':NvimTreeFindFileToggle!<CR>')

  map('<S-Left>', ':bprevious<CR>')
  map('<S-Right>', ':bnext<CR>')

  map('<Leader><space>', ':nohlsearch<CR>')

  map('<Leader>w', ':set wrap!<CR>')
  map('<Leader>n', ':set number!<CR>')
  map_callback('<Leader>p', function()
      -- TODO move to misc
      prev_conceallevel = _STATE["prev_conceallevel"] or 0
      prev_colorcolumn = _STATE["prev_colorcolumn"] or {}
      prev_number = _STATE["prev_number"] or false
      prev_paste = _STATE["prev_paste"] or false

      _STATE["prev_conceallevel"] = vim.opt.conceallevel:get()
      _STATE["prev_colorcolumn"] = vim.opt.colorcolumn:get()
      _STATE["prev_number"] = vim.opt.number:get()
      _STATE["prev_paste"] = vim.opt.paste:get()

      vim.opt.conceallevel = prev_conceallevel
      vim.opt.colorcolumn = prev_colorcolumn
      vim.opt.number = prev_number
      vim.opt.paste = prev_paste
  end)

  map('<Tab>', '>>')
  map('<S-Tab>', '<<')

  map('<C-P>', ':Telescope commands<CR>')
end

function set_lsp(bufnr)
  local function buf_callback(lhs, callback)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, '', {noremap=true, silent=true, callback=callback})
  end

  local function buf_map(lhs, rhs)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, rhs, {noremap=true, silent=true})
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

  if vim.fn.exists(':Telescope') > 0 then
    buf_callback('<F12>', function() require('telescope.builtin').lsp_definitions() end)
    buf_callback('<S-F12>', function() require('telescope.builtin').lsp_references({jump_type="never"}) end)  -- with jump it opens some strange buffer without name
  else
    buf_callback('<F12>', vim.lsp.buf.definition)
    buf_callback('<S-F12>', vim.lsp.buf.references)
  end
end

function set_quickfix()
  local function map(lhs, rhs) vim.api.nvim_set_keymap('n', lhs, rhs, {noremap=true, silent=true}) end

  map('q', ':quit<CR>')
end


function set_json_filetype()
  local bufnr = 0
  local function buf_callback(lhs, callback)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, '', {noremap=true, silent=true, callback=callback})
  end

  local jvim = require("jvim")
  buf_callback('<M-left>', jvim.to_parent)
  buf_callback('<M-right>', jvim.descend)
  buf_callback('<M-up>', jvim.prev_sibling)
  buf_callback('<M-down>', jvim.next_sibling)
end


return {
    set_global = set_global,
    set_lsp = set_lsp,
    set_quickfix = set_quickfix,
    set_json_filetype = set_json_filetype,
}
