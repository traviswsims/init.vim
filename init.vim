set bg=dark
set encoding=utf-8

set shell=zsh

" Plugged
filetype off

call plug#begin('~/.config/nvim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'


Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'vim-scripts/AnsiEsc.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

Plug 'Shougo/neocomplete.vim'
Plug 'wesQ3/vim-windowswap'

Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'

" Languages
Plug '2072/PHP-Indenting-for-VIm', {'for': 'php'}
Plug 'luochen1990/rainbow'
Plug 'dense-analysis/ale'

Plug 'traviswsims/xoria256-darker'
Plug 'traviswsims/iceburger.vim'

Plug 'jremmen/vim-ripgrep'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
Plug 'mkitt/tabline.vim'

Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/Colorizer'

Plug 'edluffy/hologram.nvim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

if has("nvim")
  Plug 'Olical/conjure', {'for': 'clojure' }
end

call plug#end()

syntax on
filetype plugin indent on

if has("nvim")
  colorscheme iceburger
  highlight NormalFloat ctermbg=238 guibg=238
endif

set laststatus=2 " powerline

set maxmempattern=2000

set vb " disable Vim bell
set nocompatible " lots of vimrc bugs otherwise
set cursorline
set ruler " show line and column number at the bottom of the screen
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
set autoread " auto-reload files changed by external source
set ic " ignore search case
set hls " highlight search matches
set nofoldenable " disable folding
set lazyredraw
set regexpengine=1
set wildignorecase " case-insensitive paths when opening files
set ttyfast
set splitbelow
set splitright
set showtabline=2
autocmd FocusGained * silent! checktime

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

map <Leader>t :NvimTreeToggle <CR> :set nu <CR>
map <Leader>n :tabe <CR>

nnoremap # :/<C-r><C-w><CR>

nnoremap <Leader>gs :Gvsplit<space>
nnoremap <Leader>vd :Gvsplit develop:%<CR>

" File types
au BufNewFile,BufRead,BufEnter *.edn      set ft=clojure
au BufNewFile,BufRead,BufEnter *.em       set ft=emblem
au BufNewFile,BufRead,BufEnter *.joke     set ft=clojure
au BufNewFile,BufRead,BufEnter *.md       set ft=markdown
au BufNewFile,BufRead,BufEnter *.md       setlocal textwidth=120
au BufNewFile,BufRead,BufEnter *.mmd      set ft=mermaid
au BufNewFile,BufRead,BufEnter *.rabl     set ft=ruby
au BufNewFile,BufRead,BufEnter *.sass     set ft=sass
au BufNewFile,BufRead,BufEnter *.tex      setlocal textwidth=120
au BufNewFile,BufRead,BufEnter  .re-natal  set filetype=json
au BufNewFile,BufRead,BufEnter Podfile    set filetype=ruby


" Don't use working location as vim's dumping ground
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swap//
set undodir=~/.config/nvim/undo//

" Remap to switch tabs
" Press Ctrl-Tab to switch between open tabs (like browser tabs) to
" the right side. Ctrl-Shift-Tab goes the other way.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

" Switch to specific tab numbers with Command-number
nnoremap <Leader>1 :tabn 1<CR>
nnoremap <Leader>2 :tabn 2<CR>
nnoremap <Leader>3 :tabn 3<CR>
nnoremap <Leader>4 :tabn 4<CR>
nnoremap <Leader>5 :tabn 5<CR>
nnoremap <Leader>6 :tabn 6<CR>
nnoremap <Leader>7 :tabn 7<CR>
nnoremap <Leader>8 :tabn 8<CR>
nnoremap <Leader>9 :tabn 9<CR>
nnoremap <Leader>0 :tablast<CR>

inoremap <D-1> <Nop>
inoremap <D-2> <Nop>
inoremap <D-3> <Nop>
inoremap <D-4> <Nop>
inoremap <D-5> <Nop>
inoremap <D-6> <Nop>
inoremap <D-7> <Nop>
inoremap <D-8> <Nop>
inoremap <D-9> <Nop>
inoremap <D-0> <Nop>

vnoremap <D-1> <Nop>
vnoremap <D-2> <Nop>
vnoremap <D-3> <Nop>
vnoremap <D-4> <Nop>
vnoremap <D-5> <Nop>
vnoremap <D-6> <Nop>
vnoremap <D-7> <Nop>
vnoremap <D-8> <Nop>
vnoremap <D-9> <Nop>
vnoremap <D-0> <Nop>

" Remap to switch buffers more naturally
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap <leader>- :vertical resize -20<CR>
nnoremap <leader>= :vertical resize +20<CR>

let g:rg_derive_root=1
let g:rg_highlight=1
noremap <Leader>r :Rg
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

noremap <F5> :e<CR>

noremap <Leader>lo :lopen<CR>
noremap <Leader>lc :lclose<CR>

noremap <Leader>st :SyntasticToggle<CR>
noremap <Leader>sc :SyntasticCheck<CR>

noremap K i<CR><Esc>

" golang
let g:vim_json_syntax_conceal = 0
let g:go_imports_autosave = 0
nnoremap <Leader>gi :GoImports<CR>:GoFmt<CR>


" vim-signify (Git status) colors
highlight SignColumn guibg=#131313
highlight DiffChange guibg=#131313 guifg=yellow
highlight DiffAdd    guibg=#131313 guifg=SpringGreen
highlight DiffDelete guibg=#131313 guifg=red1

hi TabLine      guifg=#eee   guibg=grey30
hi TabLineFill  guifg=black  guibg=grey30
hi TabLineSel   guifg=gold   guibg=grey15

let g:rainbow_active = 1
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default

let g:ale_linters = {'clojure': ['clj-kondo']}
let g:ale_virtualtext_cursor = 'disabled' " Don't show warnings/errors inline as comments.

let @n="|dt r[i    \<Esc>A :as ]\<Esc>i"       " (ns x.y.z => [x.y.z :as ]
let @r="|dt r[i    \<Esc>A :refer []]\<Esc>hi" " (ns x.y.z => [x.y.z :refer []]

" Conjure stuff
noremap <Leader>ad :ConjureShadowSelect dev<CR>
noremap <Leader>c3 :ConjureConnect 3001<CR>
noremap <Leader>c2 :ConjureShadowSelect app<CR>
noremap <Leader>k  :ConjureDocWord<CR>


if has("nvim")
  let g:conjure#mapping#doc_word = ["<Leader>ld"]
  let g:conjure#client#clojure#nrepl#mapping#session_clone = ["<Leader>s0"]
  let g:conjure#log#hud#height = 0.3
endif


noremap <Leader>gb :Git blame<CR>
noremap <Leader>vv :vsplit<CR>

" Copy to system clipbaord
noremap <Leader>vy "+y<CR>

" Paste from system clipbaord
noremap <Leader>vp "+P<CR>

" set clipboard+=unnamedplus


command JSONPretty %!python -m json.tool

lua << END

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local signs = {Error = '⨂ ', Warn = '⚠ '}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl= hl, numhl = hl })
  end

require('lualine').setup({
  options = { theme = iceburg_dark,
              icons_enabled = false
            }
})

require('telescope').setup({
  defaults = {
    layout_config = { width = 0.95,
                      height = 0.95
                    }
  }
})

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function on_nvim_tree_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', 't', api.node.open.tab,        opts('Open: New Tab'))
  vim.keymap.set('n', 's', api.node.open.vertical,   opts('Open: Vertical Split'))
  vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '?', api.tree.toggle_help,     opts('Help'))
end

-- empty setup using defaults
require('nvim-tree').setup({
  on_attach = on_nvim_tree_attach,
  view = {
    width = 35,
  },
  filters = {
    dotfiles = true,
  },
})

END


"	'ctermfgs': ['dodgerblue1', 'orange1', 'seagreen3', 'red3', 'gold1'],
let g:rainbow_conf = {
      \	'guifgs': ['dodgerblue', 'coral', '#43cd80', 'crimson', 'gold'],
      \ }

set shellcmdflag=-ic " load ~/.zshrc on vim launch
set nowrap
