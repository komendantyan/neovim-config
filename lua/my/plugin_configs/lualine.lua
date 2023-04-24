require('lualine').setup({
  -- https://github.com/nvim-lualine/lualine.nvim#default-configuration
  options = {
    -- theme = 'powerline_dark',
    theme = 'wombat',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  -- extensions = {}  -- https://github.com/nvim-lualine/lualine.nvim#default-configuration
})
