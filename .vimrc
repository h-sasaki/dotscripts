"-------------------------------------------
"" スワップファイルオフ 
"-------------------------------------------
set noswapfile

"-------------------------------------------
"" カーソル行に下線を表示
"-------------------------------------------
set cursorline

"-------------------------------------------
"" 行数表示
"-------------------------------------------
set number

"-------------------------------------------
"" vundle 設定前にファイルタイプ検知オフ
"-------------------------------------------
filetype off

"-------------------------------------------
"" vundle
"-------------------------------------------
set rtp+=~/.vim/vundle.git/ 
call vundle#rc() 

" original repos on github
" vim-scripts repos
" Bundle 'quickrun.vim'
" non github repos
Bundle 'scrooloose/nerdtree'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'Lokaltog/vim-powerline'

"-------------------------------------------
"" ディレクトリ自動作成
"-------------------------------------------
augroup vimrc-auto-mkdir
    autocmd!
    autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'),v:cmdbang)
    function! s:auto_mkdir(dir, force)
        if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
            call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
        endif
    endfunction
augroup END

"-------------------------------------------
"" カラースキーマ設定
"-------------------------------------------
colorscheme desert

"-------------------------------------------
"" シンタックス
"-------------------------------------------
syntax on

"-------------------------------------------
"" ファイルタイプ検知・設定オン
"-------------------------------------------
filetype plugin indent on

"-------------------------------------------
"" NERDTree
"-------------------------------------------
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeShowHidden = 1
set modifiable

"-------------------------------------------
"" 分割ウィンドウ時に移動を行う設定
"-------------------------------------------
noremap <C-H> <C-W>h
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
set splitbelow
set splitright

"-------------------------------------------
"" Powerline
"-------------------------------------------
let g:Powerline_symbols = 'fancy'
