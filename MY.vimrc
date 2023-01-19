" 设置行号
set nu

" 设置鼠标点击
set mouse=a

" 设置状态栏常显
set laststatus=2

" 配置文件保存后立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 文件类型侦测
filetype on

" 根据文件类型加载对应插件
filetype plugin on

" 设置实时搜索
set incsearch

" 设置标尺
set ruler

" 设置括号/引号自动补全
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap < <><esc>i
inoremap { {}<esc>i

" 设置缩进
set autoindent
set cindent

" 设置ESC快捷键
inoremap jk <ESC>

" 设置保存快捷键
nnoremap wq :wq<CR>
nnoremap w :w<CR>

" 设置Plug快捷键
nnoremap <silent> <C-i> :PlugInstall<CR>
nnoremap <silent> <C-n> :PlugClean<CR>
nnoremap <silent> <C-u> :PlugUpdate<CR>

" 文件列表插件
call plug#begin('~/.vim/plugged')

" 文件树插件
Plug 'scrooloose/nerdtree'

" 多语言语法高亮
Plug 'sheerun/vim-polyglot'

" 状态栏
Plug 'itchyny/lightline.vim'

" 主题
Plug 'keitanakamura/neodark.vim'

" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" 设置文件树快捷
nnoremap <silent> <C-e> :NERDTree<CR> "打开
nnoremap <silent> <C-e> :NERDTreeToggle<CR> "关闭

"退出文件后关闭文件树
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 设置主题
colorscheme neodark

"设置代码错误提示
set signcolumn=yes

" Coc设置回车键选中补全
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 设置新建html文件时自动填充头部信息
autocmd BufNewFile *.html exec ":call AddHtmlHead()"
func AddHtmlHead()
	call setline(1, '<!DOCTYPE HTML>')
	call setline(2, '<html>')
	call setline(3, '	<head>')
	call setline(4, '		<meta charset="utf-8">')
	call setline(5, '		<meta http-equiv="X-UA-Compatible" content="IE=edge"')
	call setline(6, '		<meta name="viewport" content="width=device-width, initial-scale=1.0">')
	call setline(7, '		<title>Document</title>')
	call setline(8, '		<link rel="stylesheet" href="./css/css.css">')
	call setline(9, '	</head>')
	call setline(10, '	<body>')
	call setline(11, '')
	call setline(12, '	</body>')
	call setline(13, '</html>')
endfunc

" 设置新建css文件自动生成头部文件
autocmd BufNewFile *.css exec ":call AddCssHead()"
func AddCssHead()
	call setline(1, "*{")
	call setline(2, "	margin: 0;")
	call setline(3, "	padding: 0;")
	call setline(4, "	box-sizing: border-box;")
	call setline(5, "}")
endfunc

" 设置python文件的注释快捷键
autocmd BufNewFile,BufReadPost *.py exec ":call PythonAnnotation()"
func PythonAnnotation()
	inoremap <C-a> #
endfunc

" 设置markdown文件的快捷键
autocmd BufNewFile,BufReadPost *.md exec ":call Markdownkey()"
func Markdownkey()
	inoremap <F1> # 
	inoremap <F2> ## 
	inoremap <F3> ### 
	inoremap <F4> #### 
	inoremap <F5> ##### 
	inoremap <F6> ###### 
	inoremap = ====<esc>hi
endfunc

autocmd BufNewFile,BufReadPost *.html exec ":call HtmlCompleteMe()"
func HtmlCompleteMe()
	inoremap div.class <div class=""></div><ESC>hhhhhi
	inoremap select.class <select class=""></select><ESC>hhhhhhhhi
	inoremap ul.class <ul class=""></ul><ESC>hhhhi
	inoremap table.class <table class=""></table><ESC>hhhhhhhi
	inoremap form.class <form class=""></form><ESC>hhhhhhi
	
endfunc	
