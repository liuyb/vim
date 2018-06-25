" ===============================================================
" SIM-VIM
" ===============================================================
"
" Author: Lauyb
" Source: https://github.com/
" Version: 0.1.0
" Created: 2017-11-24
"
" Sections:
"   - Common Settings
"   - Extend Settings
"   - Language Supports
"   - Plugins
"   - Key Mapping
"   - Plugin Settings
"   - Load Customize Settings
"
" ===============================================================


" -------------------------------------------------
" COMMON SETTINGS
" -------------------------------------------------
set      nocompatible
filetype on
filetype plugin on
syntax   on               " 开启语法高亮
syntax enable

set nofoldenable          " 默认关闭代码折叠

" 可以修改 .vimrc.local 开启代码折叠
" set foldenable
" set foldmethod=syntax

" set shell=/bin/bash

set backspace=indent,eol,start  " 智能回删
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set formatoptions=tcqro         "使得注释换行时自动加上前导的空格和星号

set number                " 显示行号          nu
set relativenumber        " 显示相对行号      rnu
set ruler                 " 显示标尺信息

set expandtab             " Tab 替换为空格    et
set smartindent           " 智能缩进          si

set softtabstop=2         " Tab 缩进单位      sts
set shiftwidth=2          " 自动缩进单位      sw
set encoding=utf-8        " UTF-8 编码
set t_Co=256              " 开启 256 色（若终端支持）
set background=dark
set nowrap                " 禁止折行

set ignorecase            " 搜索忽略大小写    ic
set incsearch             " 搜索时实时高亮    is
set hlsearch              " 高亮所有搜索结果  hls

set cursorcolumn          " 高亮当前列        cuc
set cursorline            " 高亮当前行        cul

set scrolloff=20           " 屏幕顶/底部保持 5 行文本
set laststatus=2          " 显示状态栏
set noshowmode            " 不显示当前状态
set showcmd               " 显示输入的命令
set wildmenu              " Vim 命令行提示
set nobackup              " 不生成临时文件
set noswapfile            " 不生成 swap 文件
set autoread              " 自动加载外部修改
set autowrite             " 自动保存
set confirm               " 弹出文件未保存确认

set list                  " 显示tab和空格
set lcs=tab:\|\ ,nbsp:%,trail:- " 设置tab和空格样式

set timeoutlen=700        " Time to wait for a command
let mapleader = "\<Space>" " Change the mapleader

" -------------------------------------------------
" EXTEND SETTINGS
" -------------------------------------------------
"  Close relative number in INSERT mode
augroup relative_numbser
  autocmd!
  autocmd InsertEnter * :set norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup end

" 保存时自动删除多余空格 自动将tab转换为空格
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * :%s/\r\+$//e
autocmd BufWritePre * :%retab!

" -------------------------------------------------
" LANGUAGE SUPPORTS
" -------------------------------------------------
if filereadable(expand($HOME . '/.vimrc.language'))
  source $HOME/.vimrc.language
endif

" -------------------------------------------------
" PLUGINS
" -------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'         " 启动页
Plug 'gorodinskiy/vim-coloresque' " 颜色预览
Plug 'jiangmiao/auto-pairs'       " 符号自动补全
Plug 'tpope/vim-surround'         " 自动增加、替换配对符
Plug 'chxuan/change-colorscheme'  " 配色切换
Plug 'tomtom/tcomment_vim'        " 添加注释
Plug 'tpope/vim-repeat'           " 增强 . 命令
Plug 'terryma/vim-expand-region'  " 可视区域选择增强
Plug 'rizzatti/dash.vim'          " Dash文档搜索
Plug 'metakirby5/codi.vim'        " 直接运行代码
Plug 'tpope/vim-fugitive'         " GIT命令增强
Plug 'chemzqm/wxapp.vim'          " 微信小程序支持
Plug 'easymotion/vim-easymotion'  " 快速移动
Plug 'airblade/vim-gitgutter'     " GIT STATUS
Plug 'kaicataldo/material.vim'    " material 配色
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 文件搜索
Plug 'Shougo/deoplete.nvim'| Plug 'roxma/nvim-yarp' | Plug 'roxma/vim-hug-neovim-rpc'
Plug 'dyng/ctrlsf.vim'            " 全文搜索
Plug 'ujihisa/neco-look'          " 增加英文字典

" Plugins for language
" markdown
if count(g:language_group, 'markdown')
  Plug 'plasticboy/vim-markdown'                          " Markdown 代码高亮，自动格式化
  Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'} " Markdown 预览
endif

" html
if count(g:language_group, 'html')
  Plug 'docunext/closetag.vim' " 自动关闭 HTML 标签
endif

" css
if count(g:language_group, 'css')
  Plug 'hail2u/vim-css3-syntax', {'for': 'css'}
endif

" js
if count(g:language_group, 'js')
  Plug 'pangloss/vim-javascript'
endif

" json
if count(g:language_group, 'json')
  Plug 'elzr/vim-json' " json 语法检查
endif

" php
if count(g:language_group, 'php')
  Plug 'yeaha/vim-phpfmt' " 格式化代码
endif

" python
if count(g:language_group, 'python')
  Plug 'hdima/python-syntax'
endif

" c
if count(g:language_group, 'c')
endif

" go
if count(g:language_group, 'go')
  Plug 'fatih/vim-go', { 'for': 'go' } " Golang
endif

call plug#end()


" -------------------------------------------------
" KEY MAPPING
" -------------------------------------------------
" Shortcut for Moving in INSERT mode
imap <C-A> <Home>
imap <C-E> <End>

" Navigation Between Windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Buffer Jump
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" Prev Tab
nnoremap <S-H> gT
" Next Tab
nnoremap <S-L> gt

" New Terminal
nnoremap <Leader>t :bel term<CR>

" Change Color Scheme
map  <F10> :NextColorScheme<CR>
imap <F10> <Esc> :NextColorScheme<CR>
map  <F9>  :PreviousColorScheme<CR>
imap <F9>  <Esc> :PreviousColorScheme<CR>

" :W to save file by sudo
command W w !sudo tee % > /dev/null

" NERDTree
nnoremap <C-E>     :NERDTreeToggle<CR>
nnoremap <Leader>e :NERDTreeToggle<CR>

" CtrlSF
nmap     <C-F>g <Plug>CtrlSFCwordExec
nmap     <C-F>f <Plug>CtrlSFPrompt
nnoremap <C-F>t :CtrlSFToggle<CR>

" -------------------------------------------------
" PLUGIN SETTINGS
" -------------------------------------------------
" Language plugin settings
if count(g:language_group, 'markdown')
  let g:vim_markdown_new_list_item_indent = 2
endif

if count(g:language_group, 'css')
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END
endif

if count(g:language_group, 'js')
  let g:javascript_plugin_jsdoc = 1
endif

" Startify Header
let g:startify_custom_header=['Welcome ']

" NERDTree
let NERDTreeChDirMode=2
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers=1
let g:NERDTreeWinSize=35
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_theme = 'material'

" vim-startify
let g:startify_change_to_dir = 0
let g:startify_bookmarks = [ {'c': '~/.vim/vimrc'}, '~/.zshrc', {'h': '/etc/hosts'} ]
let g:startify_change_to_vcs_root = 1

" phpfmt
let g:phpfmt_on_save = get(g:, 'phpfmt_on_save', 1) " format on save (autocmd)
let g:phpfmt_php_path = "/usr/bin/php"               " Path to PHP
let g:phpfmt_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:phpfmt_indent_with_space = 2         " use spaces instead of tabs for indentation

" LeaderF
let g:Lf_ShortcutF = '<Leader>f'
let g:Lf_DefaultMode = 'FullPath'
map     <Leader>g :LeaderfTag<CR>

" deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

colorscheme material
set rtp+=~/.vim/plugged/material.vim
set background=dark
colorscheme material
if (has("termguicolors"))
  set termguicolors
endif
let g:material_terminal_italics = 1

" easymotion Move to word
nmap s <Plug>(easymotion-overwin-f2)
nmap <Leader>w <Plug>(easymotion-overwin-w)
