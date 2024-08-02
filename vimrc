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
" 激活matchit.vim，该插件可以扩展%用于匹配xml标签
runtime macros/matchit.vim

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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call plug#begin('~/.vim/plugged')
"
" Plug 'tpope/vim-surround'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/vim-auto-popmenu'
" Plug 'skywind3000/vim-dict'
" Plug 'skywind3000/gutentags_plus'
" Plug 'mhinz/vim-startify'
" Plug 'voldikss/vim-floaterm'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'tpope/vim-fugitive'
" Plug 'zivyangll/git-blame.vim'
" Plug 'preservim/nerdtree'
" Plug 'preservim/nerdcommenter'
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
" let g:gutentags_project_root = ['.git', '.svn', '.root', '.project']
" 数据库文件的文件名 = 项目工程绝对路径 + $(gutentags_ctags_tagfile)
" let g:gutentags_ctags_tagfile = 'tags'
" 配置gutentags插件支持ctags
" let g:gutentags_modules = []
" if executable('ctags')
" 	let g:gutentags_modules += ['ctags']
" endif
" 配置gutentags插件支持gtags
" if executable('gtags-cscope') && executable('gtags')
" 	let g:gutentags_modules += ['gtags_cscope']
" endif
" 将自动生成的数据库文件全部放入~/.cache/tags目录中，避免污染工程目录
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" 检测~/.cache/tags/是否存在，如若不存在就新建
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
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Close the tab if NERDTree is the only window remaining in it.
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
" autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" 打开/关闭NERDTree窗口
" nnoremap <silent><F3> :NERDTreeToggle<CR>
" 定位当前活动缓冲区
" nnoremap <silent><F4> :NERDTreeFind<CR>
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
" let g:Lf_MruMaxFiles=50
" let g:Lf_GtagsAutoGenerate = 1
" let g:Lf_ShortcutF = "<leader>ff"
" noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncomplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <Space>h <Plug>AirlineSelectPrevTab
" nmap <Space>l <Plug>AirlineSelectNextTab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
