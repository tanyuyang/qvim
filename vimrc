""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My Name     : TYY
" VIM Version : VIM 8.0
" Description : Not support GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用非兼容模式
set nocompatible

" 编码设置
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 加载文件类型侦测
filetype on
" 加载基于文件类型的插件
filetype plugin on
" 加载基于文件类型的缩进
filetype indent on

" 显示行号
set number
" 显示模式
set showmode
" 显示命令
set showcmd
" 显示光标位置信息
set ruler
" 总是显示底部状态栏
set laststatus=2
" 设置tab键占4个字符长度
set tabstop=4
" 设置编辑状态时按退格键退回缩进的长度
set softtabstop=4
" 设置缩进占4个字符长度
set shiftwidth=4
" 设置tab键转换为空格键
set expandtab
" 搜索时忽略大小写
set ignorecase
" 高亮显示搜索匹配结果
set hlsearch
" 输入搜索模式时就高亮显示匹配结果
set incsearch
" 如果搜索模式含有大写字母，就不使用忽略大小写选项
set smartcase
" 重复搜索到达文件两端时，禁止循环搜索
set nowrapscan
" 允许在还有修改未保存时离开缓冲区
set hidden
" 禁止产生备份文件
set nobackup
" 禁止产生交换文件
set noswapfile
" 在命令行模式中使用tab键补全时列出所有的可选项
set wildmode=longest,list
" 在光标下显示横线，有主题，显示效果可能会变化，比如变成高亮显示当前行
set cursorline

" 使用配色方案
" colorscheme molokai

" 设置tags文件的路径
set tags=./tags;,tags

" 插入模式下，按下jj或JJ相当于esc
inoremap jj <esc>
inoremap JJ <esc>
" 禁用箭头键
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
" 快速切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 命令行模式下，让<C-p>、<C-n>组合键像<Up>、<Down>一样有过滤功能
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" 文件类型为Makefile时，避免将tab转换成空格
autocmd Filetype make set noexpandtab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下设置来自于vim内置文档的推荐设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if has("cscope")
" 	set csprg=/usr/bin/cscope
" 	set csto=0
" 	set cst
" 	set nocsverb
" 	" add any database in current directory
" 	if filereadable("cscope.out")
" 	    cs add cscope.out
" 	" else add database pointed to by environment
" 	elseif $CSCOPE_DB != ""
" 	    cs add $CSCOPE_DB
" 	endif
" 	set csverb
" endif

" 查找调用本函数的函数
" nnoremap <silent><leader>c :cs f c <C-R>=expand("<cword>")<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gtags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 如果安装了global，global有三个命令：global gtags gtags-cscope
" 其中gtags-cscope可以生成类似于cscope的数据库
" 要想更好的使用gtags-cscope生成的数据库，还需要安装gutentags_plugs插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call plug#begin('~/.vim/plugged')
"
" 定义插件，默认用法
" Plug 'tpope/vim-surround'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/vim-auto-popmenu'
" Plug 'skywind3000/vim-dict'
" Plug 'skywind3000/gutentags_plus'
" Plug 'mhinz/vim-startify'
" Plug 'preservim/nerdtree'
" Plug 'preservim/nerdcommenter'
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" 设置插件更新后的钩子
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
"
" call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" let g:gutentags_project_root = ['.git', '.svn', '.root', '.project']
" 所生成的数据文件的文件名
" 文件名 = tags文件的工程绝对路径 + $(gutentags_ctags_tagfile)
" let g:gutentags_ctags_tagfile = 'tags'
" 可以配置gutentags插件同时支持ctags和gtags
" let g:gutentags_modules = []
" if executable('ctags')
" 	let g:gutentags_modules += ['ctags']
" endif
" 建议还是不要打开对gtags的支持了，cscope足够使用了
" if executable('gtags-cscope') && executable('gtags')
" 	let g:gutentags_modules += ['gtags_cscope']
" endif
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建
" if !isdirectory(s:vim_tags)
"    silent! call mkdir(s:vim_tags, 'p')
" endif
" 配置ctags的参数，老的Exuberant-ctags不能有--extra=+q
" let g:gutentags_ctags_extra_args = ['--extra=+q']
" let g:gutentags_ctags_extra_args = ['--fields=+niazS']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 新的Universal-ctags需要增加下面一行，老的Exuberant-ctags不能加下一行
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用gutentags自动加载gtags数据库的行为
" let g:gutentags_auto_add_gtags_cscope = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags_plus
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 虽然gtags自带对cscope的支持，gutentags也配置了生成类似cscope的数据库
" 但是还需要自动添加gtags-cscope数据库的插件，这个插件就是gutentags_plus
" 先取消插件的默认映射
" let g:gutentags_plus_nomap = 1
" 查找调用本函数的函数
" noremap <silent> <leader>c :GscopeFind c <C-R><C-W><cr>
" 注意：这个插件和NERDTree插件有一点点冲突，这个插件可能要求vim在打开文件时
"       不能有其它buffer存在，所以如果NERDTree配置了进入vim时自动打开的话，这就有问题了
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-auto-popmenu
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设定需要生效的文件类型，如果是“*”的话，代表所有类型
" let g:apc_enable_ft={'*':1}
" let g:apc_enable_ft={'text':1, 'markdown':1}
" 设定从字典文件以及当前打开的文件里收集补全单词，详情看':h cpt'
" set cpt=.,k,w,b
" 不要自动选中第一个选项
" set completeopt=menu,menuone,noselect
" 禁止在下方显示一些啰嗦的提示
" set shortmess+=c
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:ycm_server_python_interpreter='/usr/bin/python'
" let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" let g:ycm_show_diagnostics_ui=0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" 下面这行配置和gutentags_plus插件有冲突，看情况打开这行配置
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" 打开/关闭NERDTree窗口
" nnoremap <leader>t :NERDTreeToggle<CR>
" 定位当前活动缓冲区
" nnoremap <leader>g :NERDTreeFind<CR>
" 右边显示
" let g:NERDTreeWinPos='right'
" 忽略以下文件的显示
" let g:NERDTreeIgnore=['\.swp','\.o','\.bin','\.img']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>f	默认占用，搜索文件
" <leader>b	默认占用，搜索当前buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:Lf_HideHelp = 1
" let g:Lf_UseCache = 0
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" 打开MRU列表
" nnoremap <silent><leader>m :Leaderf! mru<CR>
" 打开Function列表
" nnoremap <silent><leader>z :Leaderf! function<CR>
" 打开Tag列表
" nnoremap <silent><leader>v :Leaderf! bufTag<CR>
" 打开rg模糊搜索的命令行交互界面
" nnoremap <silent><leader>r :LeaderfRgInteractive<CR>
" search word under cursor, the pattern is treated as regex, and enter normal mode directly
" nnoremap <silent><leader>s :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
" xnoremap <silent><leader>s :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR><CR>
" recall last search. If the result window is closed, reopen it.
" nnoremap <silent><leader>a :<C-U>Leaderf! rg --recall<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插入模式下，如果打开了补全菜单，按<CR>键确认光标下的补全项
" inoremap <silent><expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" 如果没有选择任何补全项，按下<CR>键会自动选择第一个补全项并确认它
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" 插入模式下，如果打开了补全菜单，使用tab键可以进行补全项的确认
" inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
" inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开文件或书签时，不要将工作目录切换到文件所在的目录
" let g:startify_change_to_dir = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 在statusline中显式当前git仓库的分支
" let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'gitbranch#name'
"       \ },
"       \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change tab quickly
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap <silent><leader>1 :tabn 1<CR>
" nnoremap <silent><leader>2 :tabn 2<CR>
" nnoremap <silent><leader>3 :tabn 3<CR>
" nnoremap <silent><leader>4 :tabn 4<CR>
" nnoremap <silent><leader>5 :tabn 5<CR>
" nnoremap <silent><leader>6 :tabn 6<CR>
" nnoremap <silent><leader>7 :tabn 7<CR>
" nnoremap <silent><leader>8 :tabn 8<CR>
" nnoremap <silent><leader>9 :tabn 9<CR>
" nnoremap <silent><leader>0 :tabn 10<CR>
" nnoremap <silent><F5> :tabprevious<CR>
" nnoremap <silent><F6> :tabnext<CR>
" nnoremap <silent><F7> :tabclose<CR>
" nnoremap <silent><F8> :tabonly<CR>
