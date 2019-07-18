call plug#begin('~/.config/nvim/plugged')

Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'neoclide/coc-tsserver', {'do': 'npm install'}
Plug 'neoclide/coc-eslint', {'do': 'npm install'}
Plug 'neoclide/coc-json', {'do': 'npm install'}
Plug 'neoclide/coc-prettier', {'do': 'npm install'}
Plug 'neoclide/coc-css', {'do': 'npm install'}
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/neoinclude.vim'
Plug 'airblade/vim-rooter'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/goyo.vim'

call plug#end()

map <Space> <leader>
colorscheme space-vim-dark


"basics"
set number relativenumber
set nobackup
set noswapfile
set ai
set laststatus=2
set updatetime=250
set hidden
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}
noremap <A-w> :bd
noremap <S-l> gt
noremap <S-h> gT
noremap <S-Right> gt
noremap <S-Left> gT
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <leader>q :wq<cr>
noremap <leader>s :w<cr>
noremap <leader>s :w<cr>
noremap <C-Right> <C-w>l
noremap <C-Left> <C-w>h
noremap <C-Down> <C-w>j
noremap <C-Up> <C-w>k
map <A-left> :tabp<cr>
map <A-right> :tabn<cr>

map <C-p> :Files<cr>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

map <C-b> :NERDTreeToggle<CR>

"indent"
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2



" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use TAB to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-y>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Fuzzy search strings with ag
 let g:agprg="ag -i --vimgrep"
 let g:ag_highlight=1
 " map \ to the ag command for quick searching
 nnoremap \ :Ag<SPACE>


nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
