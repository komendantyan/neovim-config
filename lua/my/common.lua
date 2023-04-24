local opt = vim.opt
local g = vim.g


-- filetype plugin indent on
-- syntax on

------------ tab --------------------
opt.tabstop = 4
opt.shiftwidth = 0  -- same as tabstop
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

------------ undo & history ---------
opt.undofile = true                -- Save undo's after file closes
-- set undodir=$HOME/.vim/undo " where to save undo histories
opt.undolevels=1000         -- How many undos
opt.undoreload=10000        -- number of lines to save for undo

opt.history=1000    -- commands and searches history

-- if empty(glob(&undodir))
--     call mkdir(&undodir, 'p')
-- endif

----------- search ------------------
opt.incsearch = true       -- show what found while typing search pattern
opt.hlsearch = true        -- highlight what found
opt.ignorecase = true      -- when searching pattern
opt.wrapscan = false      -- do not loop search
opt.smartcase = true       -- smart case when searching (a=[aA], [A]=[A])

----------- view --------------------
opt.scrolloff = 3    -- minimal lines above and bellow cursor
opt.sidescrolloff = 0    -- minimal columns to the left and right of cursor
opt.list = true
opt.listchars = [[tab:»·,trail:·,extends:…,precedes:…,nbsp:~]]
opt.display = 'uhex'    -- Show unprintable characters hexadecimal as <xx>
opt.number = true
opt.wildmenu = true

opt.ttyfast = true

----------- cursor line -------------
opt.cursorline = true
opt.colorcolumn = '80,100,200'

----------- modeline ----------------
opt.modeline = true
