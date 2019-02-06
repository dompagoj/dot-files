call plug#begin('~/.vim/plugged')
Plug 'peitalin/vim-jsx-typescript'
Plug 'joshdick/onedark.vim'
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs'
Plug 'pangloss/vim-javascript'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'

call plug#end()

colorscheme onedark
let g:deoplete#enable_at_startup = 1

"basics"
set number relativenumber
set nobackup
set noswapfile
set ai
set laststatus=2
set updatetime=750
map! <Leader>, <C-Y>,
noremap <A-w> :bd
noremap <S-l> gt
noremap <S-h> gT
noremap <S-Right> gt
noremap <S-Left> gT
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <leader>q :q<cr>
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>
noremap <C-Right> <C-w>l
noremap <C-Left> <C-w>h
noremap <C-Down> <C-w>j
noremap <C-Up> <C-w>k
map <C-p> :Files<cr>
let g:rust_recommended_style = 0

"set completeopt-=preview
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_echo_current_diagnostic = 0
let g:ycm_collect_identifiers_from_tags_files = 1

" Formatting
let g:rustfmt_autosave = 1

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

"tslint magic"
autocmd BufWritePost *.ts,*.tsx call tslint#run('a', win_getid())

augroup tslint
  function! s:typescript_after(ch, msg)
    let cnt = len(getqflist())
    if cnt > 0
      echomsg printf('[Tslint] %s errors', cnt)
    endif
  endfunction
  let g:tslint_callbacks = {
    \ 'after_run': function('s:typescript_after')
    \ }

  let g:tsuquyomi_disable_quickfix = 1

  function! s:ts_quickfix()
    let winid = win_getid()
    execute ':TsuquyomiGeterr'
    call tslint#run('a', winid)
  endfunction

  autocmd BufWritePost *.ts,*.tsx silent! call s:ts_quickfix()
  autocmd InsertLeave *.ts,*.tsx silent! call s:ts_quickfix()
augroup END

