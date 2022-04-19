set encoding=utf-8

set shell=zsh

" Plugged
  filetype off
  call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'

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
  Plug 'vim-scripts/Flex-4', {'for': ['actionscript', 'mxml']}
  Plug 'luochen1990/rainbow'
  Plug 'aclaimant/syntastic-joker'
  Plug 'vim-syntastic/syntastic'

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

  if has("nvim")
    Plug 'Olical/conjure', {'tag': 'v4.16.0'}
  end

  call plug#end()

syntax on
filetype plugin indent on

if has("gui_macvim") || has("nvim")
  colorscheme iceburger
  highlight NormalFloat ctermbg=238 guibg=238
endif

if has("gui_macvim")
  set cryptmethod=blowfish2
  set guifont=FiraCode-Retina:h16
  set linespace=7
endif

set laststatus=2 " powerline


set cursorline
set nocompatible " lots of vimrc bugs otherwise
set vb " disable Vim bell
set ruler " show line and column number at the bottom of the screen
set nowrap
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set number
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
set autoread " auto-reload files changed by external source
autocmd FocusGained * silent! checktime

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

map <Leader>t :NERDTreeToggle <CR> :set nu <CR>

" commment lines on Command+k
map <D-k> <Leader>c<Space>

 " normal, visual, select modes
map <F1> <Esc>
 " insert, command modes
map! <F1> <Esc>

" File types
au BufNewFile,BufRead,BufEnter *.sass set ft=sass
au Bufread,BufNewFile *.as   set ft=actionscript
au BufRead,BufNewFile *.mxml set ft=actionscript
au BufRead,BufNewFile *.edn  set ft=clojure
au BufRead,BufNewFile *.em   set ft=emblem
au BufNewFile,BufRead,BufEnter *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal textwidth=120
au BufRead,BufNewFile *.tex setlocal textwidth=120
au BufRead,BufNewFile *.rabl set ft=ruby
au BufRead,BufNewFile Podfile set filetype=ruby
au BufRead,BufNewFile .re-natal set filetype=json


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
nnoremap <D-1> :tabn 1<CR>
nnoremap <D-2> :tabn 2<CR>
nnoremap <D-3> :tabn 3<CR>
nnoremap <D-4> :tabn 4<CR>
nnoremap <D-5> :tabn 5<CR>
nnoremap <D-6> :tabn 6<CR>
nnoremap <D-7> :tabn 7<CR>
nnoremap <D-8> :tabn 8<CR>
nnoremap <D-9> :tabn 9<CR>
nnoremap <D-0> :tablast<CR>

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <D-]> :vertical resize -20<CR>
nnoremap <D-[> :vertical resize +20<CR>


let g:rg_derive_root=1
let g:rg_highlight=1
noremap <Leader>r :Rg
" noremap <Leader>f :FZF .<CR>
" noremap <Leader>fs :FZF src/<CR>
" noremap <Leader>F :FZF<Space>
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

let g:vim_json_syntax_conceal = 0


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

let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

" autocmd BufEnter * lcd %:p:h


" Syntastic
if has("gui_macvim") || has("nvim")
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 0
  let g:syntastic_check_on_wq = 0

  let g:syntastic_mode_map = {
      \ "mode": "active",
      \ "passive_filetypes": ["clojure"] }

  let g:syntastic_clojure_checkers = ['joker']


  highlight SyntasticWarning guibg=#d8d809 guifg=black
  highlight SyntasticError guibg=#6c0001 guifg=white

endif

" Conjure stuff
noremap <Leader>ad :ConjureShadowSelect android-dev<CR>
noremap <Leader>id :ConjureShadowSelect ios-dev<CR>
noremap <Leader>k  :ConjureDocWord<CR>


if has("nvim")
  let g:conjure#mapping#doc_word = ["<Leader>ld"]
  let g:conjure#client#clojure#nrepl#mapping#session_clone = ["<Leader>s0"]
  let g:conjure#log#hud#height = 1.0
  let g:conjure#log#wrap = 1
endif


noremap <Leader>gb :Git blame<CR>
noremap <Leader>vv :vsplit<CR>


command JSONPretty %!python -m json.tool

lua << END
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
END
