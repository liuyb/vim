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
" set mouse=a
set pastetoggle=<F9>

"使得注释换行时自动加上前导的空格和星号
set formatoptions=tcqro

" 高亮搜索显示
set hlsearch

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
" let g:airline_theme = 'tomorrow'
let g:bufferline_echo = 0
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
Bundle 'ChrisKempson/Vim-Tomorrow-Theme'
colorscheme Tomorrow-Night

" Bundle 'VimIM'
" :let g:vimim_cloud = 'qq' "vim i vimim
" :let g:vimim_toggle = 'pinyin,qq'

Bundle 'ctrlp.vim'
let g:ctrlp_working_path_mode = 'wa'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,tags
let g:ctrlp_cmd = 'CtrlPMixed'

Bundle 'craigemery/vim-autotag'
let g:autotagTagsFile="tags"

Bundle 'dyng/ctrlsf.vim'
" ack效率最好，但是安装有问题，暂时用ag搜索
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_ignore_dir=['tags']
nmap     <F5> <Plug>CtrlSFPrompt
map     <F6> :CtrlSFToggle<CR>

"snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
let g:snippets_dir = "~/.vim/snippets"
let g:snips_author = "liuyb <lauyb@vip.qq.com>"

"Emmet
Plugin 'mattn/emmet-vim'

"vim-jade
Plugin 'digitaltoad/vim-jade'

"less
Bundle 'groenewege/vim-less'

"Jquery
Bundle 'jQuery'

" Taglist
Bundle 'taglist.vim'

" Settings for tagslist
let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1 "当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1 "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name' "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1 "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32 "设置窗体宽度为32，可以根据自己喜好设置
let Tlist_Ctags_Cmd ='ctags' "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个
map t :TlistToggle<CR>

" YouCompleteMe
Bundle 'Valloric/YouCompleteMe'

filetype plugin indent on     " required!

