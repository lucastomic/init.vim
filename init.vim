call plug#begin('~/AppData/Local/nvim/pluggedf')

"Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
    \ }
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"Flutter
Plug 'neoclide/coc.nvim', {'branch': 'release'} " COC
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'Neevash/awesome-flutter-snippets'

"Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

"Auto-Pairs
Plug 'jiangmiao/auto-pairs'

"Theme
Plug 'Softmotions/vim-dark-frost-theme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

"NerdTree
Plug 'preservim/nerdtree'

"Airline"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"EasyMotion
Plug 'easymotion/vim-easymotion'

"Comment
Plug 'numToStr/Comment.nvim'

"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

set mouse=nicr
set noerrorbells                                              " Don't add sounds for errors
set number
set relativenumber
set nowrap
set nohlsearch
set smartcase
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim-data/backup
set undofile
set incsearch
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=2
set encoding=utf-8
set clipboard=unnamedplus
set backspace=indent,eol,start
highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader = " "

nnoremap <Leader>+ :tabnew<CR> 
nnoremap <C-Left> :tabp<CR>                                                                            
nnoremap <C-Right> :tabn<CR>
nnoremap <Leader>b :e#<CR>

" PLUGINS CONFIGURATIONS------------------------------------------------------------------------
"Comment-------------------------------------------------------------
lua require('Comment').setup()

"Theme--------------------------------------------------------
colorscheme codedark

"NerdTree--------------------------------------------------------
nnoremap <C-t> :NERDTreeToggle<CR>

"Coc--------------------------------------------------------
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
if CocAction('hasProvider', 'hover')
call CocActionAsync('doHover')
else
call feedkeys('K', 'in')
endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Show all diagnostics.
nnoremap <silent><nowait> <C-a>  :<C-u>CocList diagnostics<cr>

"Airline-----------------------------------------------------------------
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 

"EasyMotion-------------------------------------------------------------------------
nmap <Leader>s <Plug>(easymotion-overwin-f2)

"Telescope-------------------------------------------------------------------------
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" LENGUAJES----------------------------------------------------------------------------------------
"Golang------------------------------
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Launch gopls when Go files are in use
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

"Autocompletion
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})
let g:deoplete#enable_at_startup = 1

"Flutter--------------------------------
nnoremap <leader>fr :FlutterRun<cr>
nnoremap <leader>fh :FlutterHotRestart<cr>
nnoremap <leader>ft :FlutterSplit<cr>

