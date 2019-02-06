call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'build': './install.sh'}
Plug 'peitalin/vim-jsx-typescript'
Plug 'joshdick/onedark.vim'
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete-clangx'
Plug 'Shougo/neoinclude.vim'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'airblade/vim-rooter'
Plug 'w0rp/ale'
Plug 'palantir/tslint'

call plug#end()

map <Space> <leader>
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/home/dompa/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/dompa/.cargo/src/rust/src'

colorscheme onedark

"basics"
set number relativenumber
set nobackup
set noswapfile
set ai
set laststatus=2
set updatetime=250
noremap <leader>e :call emmet#expandAbbr(3,"")<cr>
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
let g:rust_recommended_style = 0

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let g:tsuquyomi_shortest_import_path = 1
let g:prettier#config#print_width = 120
let g:prettier#config#tab_width = 2
let g:prettier#config#use_tabs = 'false'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#parser = 'typescript'
let g:prettier#config#config_precedence = 'prefer-file'
let g:prettier#config#prose_wrap = 'preserve'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

map <C-n> :NERDTreeToggle<CR>

"indent"
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

