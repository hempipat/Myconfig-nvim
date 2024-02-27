local opt = vim.opt -- for conciseness

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
--[[ opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one ]]

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
-- opt.background = "dark" -- colorschemes that can be light or dark will be made dark
-- opt.colorcolumn = "100"
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

local home = os.getenv("HOME")

--[[ vim.g.loaded_matchparen = 1

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local home = os.getenv("HOME")
local opt = vim.opt

-- Ignore compiled files
opt.wildignore = '__pycache__'
opt.wildignore:append { '*.o', '*~', '*.pyc', '*pycache*' }
opt.wildignore:append 'Cargo.lock'

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = 'longest:full'
opt.wildoptions = 'pum'

opt.showmode = false
opt.showcmd = true
opt.cmdheight = 1 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = false -- Show line numbers
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function
opt.scrolloff = 10 -- Make it so there are always ten lines below my cursor

-- Cursorline highlighting control
--  Only have it on in the active buffer
opt.cursorline = true -- Highlight the current line
local group = vim.api.nvim_create_augroup('CursorLineControl', { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline('WinLeave', false)
set_cursorline('WinEnter', true)
set_cursorline('FileType', false, 'TelescopePrompt')

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

opt.foldmethod = 'marker'
opt.foldlevel = 0
opt.modelines = 1

opt.belloff = 'all' -- Just turn the dang bell off

opt.clipboard = 'unnamedplus'

opt.inccommand = 'split'
opt.swapfile = false -- Living on the edge
opt.shada = { '!', "'1000", '<50', 's10', 'h' }

opt.mouse = 'a'

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.

-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
  - 'a' -- Auto formatting is BAD.
  - 't' -- Don't auto format my code. I got linters for that.
  + 'c' -- In general, I like it when comments respect textwidth
  + 'q' -- Allow formatting comments w/ gq
  - 'o' -- O and o, don't continue comments
  + 'r' -- But do continue when pressing enter.
  + 'n' -- Indent past the formatlistpat, not underneath it.
  + 'j' -- Auto-remove comments if possible.
  - '2' -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = '~' }

vim.opt.diffopt = { 'internal', 'filler', 'closeoff', 'hiddenoff', 'algorithm:minimal' }

vim.opt.undofile = true
vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 3 ]]

-- sidebar
-- opt.number = true -- line number on the left
-- opt.numberwidth = 3 
-- opt.showcmd = true -- display command in bottom bar

-- backup and undo
opt.backup = true
opt.swapfile = false
opt.backupdir = home .. '/.config/nvim/.backup/'
opt.directory = home .. '/.config/nvim/.swp/'
opt.undodir = home .. '/.config/nvim/.undo/'
opt.undofile = true
opt.undolevels = 1000
opt.undoreload = 10000

-- format
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.cindent = true
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
opt.smarttab = true


opt.breakindent = true
opt.showbreak = string.rep(' ', 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

--[[ opt.foldmethod = 'marker'
opt.foldlevel = 0
opt.modelines = 1 ]]
opt.foldenable = true
opt.foldlevelstart = 99
