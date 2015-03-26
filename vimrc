let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

syntax on
set smartindent
set pastetoggle=<F9>
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set cursorline
set t_Co=256
set laststatus=2
set noshowmode
set scrolloff=30
set mouse=a

"使得注释换行时自动加上前导的空格和星号
set formatoptions=tcqro

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
" 保存时自动将tab转换为空格
autocmd BufWritePre * :%retab!

autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js,*.jade set expandtab tabstop=2 shiftwidth=2

hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white

set nocompatible               " be iMproved
filetype off                   " required!       /**  从这行开始，vimrc配置 **/

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:  /* 插件配置格式 */
"
" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos  （vim-scripts仓库里的，按下面格式填写）
Bundle 'The-NERD-tree'
map <F2> :NERDTreeToggle<CR>
" 开关文件浏览器
" 在文件浏览器中定位当前文件
" map <D-!> :NERDTreeFind <CR>
" let NERDTreeQuitOnOpen = 1

" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos   (非上面两种情况的，按下面格式填写)
" Bundle 'git://git.wincent.com/command-t.git'
" ...
Plugin 'bling/vim-airline'
let g:airline_theme = 'tomorrow'
let g:bufferline_echo = 0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
Bundle 'ChrisKempson/Vim-Tomorrow-Theme'
colorscheme Tomorrow-Night

" Bundle 'VimIM'
" :let g:vimim_cloud = 'qq' "vim i vimim
" :let g:vimim_toggle = 'pinyin,qq'

Bundle 'ctrlp.vim'

Bundle 'dyng/ctrlsf.vim'
" ack效率最好，但是安装有问题，暂时用ag搜索
let g:ctrlsf_ackprg = 'ag'

"snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
let g:snippets_dir = "~/.vim/snippets"
let g:snips_author = "weegc <weegc@163.com>"

"Emmet
Plugin 'mattn/emmet-vim'

"vim-jade
Plugin 'digitaltoad/vim-jade'

filetype plugin indent on     " required!
