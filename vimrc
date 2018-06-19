syntax on
set backspace=2
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set nu
set cursorline
set t_Co=256
set laststatus=2
set noshowmode
set scrolloff=30
set mouse=v
set pastetoggle=<F9>

"使得注释换行时自动加上前导的空格和星号
set formatoptions=tcqro

" 高亮搜索显示
set hlsearch

" 复制自动到粘贴板
set clipboard=unnamed

" 显示tab和空格
set list
" 设置tab和空格样式
set lcs=tab:\|\ ,nbsp:%,trail:-
" 设定行首tab为灰色
highlight LeaderTab guifg=#666666
" 匹配行首tab
match LeaderTab /^\t/

" 保存时自动删除多余空格
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\r\+$//e
" 保存时自动将tab转换为空格
autocmd BufWritePre * :%retab!

autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.jade set expandtab tabstop=2 shiftwidth=2

"php funclist
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dictionary-=~/.vim/php_funclist.txt dictionary+=~/.vim/php_funclist.txt
    set complete-=k complete+=k
endfunction

hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" LeaderF
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
let g:Lf_ShortcutF = '<F7>'
map     <F8> :LeaderfTag<CR>

" easytag
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

" dyng/ctrl.vim
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_ignore_dir=['tags']
nmap     <F5> <Plug>CtrlSFCwordExec
nmap     <F6> :CtrlSFToggle<CR>

Plug 'janko-m/vim-test'
Plug 'chemzqm/vim-run'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
map <F2> :NERDTreeToggle<CR>

" easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

let g:EasyMotion_do_mapping = 1 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <F3> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

Plug 'chemzqm/wxapp.vim'

Plug 'yeaha/vim-phpfmt'
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
let g:phpfmt_php_path = "/usr/bin/php"               " Path to PHP
"let g:phpfmt_prepasses_list = "AutoPreincrement,JointToImplode"
"let g:phpfmt_passes_list = "ReturnNull"
let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:phpfmt_indent_with_space = 2         " use spaces instead of tabs for indentation
"let g:phpfmt_enable_auto_align = 1         " Enable auto align of = and =>
"let g:phpfmt_visibility_order = 1          " Fixes visibiliy order for method in classes - PSR-2 4.2
"let g:smart_linebreak_after_curly = 1      " Convert multistatement blocks into multiline blocks

Plug 'maksimr/vim-jsbeautify'
autocmd BufWritePre *.js :call RangeJsBeautify()
autocmd BufWritePre *.json :call RangeJsonBeautify()
autocmd BufWritePre *.html :call RangeHtmlBeautify()
autocmd BufWritePre *.css :call RangeCSSBeautify()

call plug#end()

