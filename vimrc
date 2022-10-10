""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Version : VIM 8.0
" My Name     : TYY
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
" 设置缩进占4个字符长度
set shiftwidth=4
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
colorscheme molokai

" 设置tags文件的路径
set tags=./tags;,tags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 默认的标签文件包含文件路径，十分凌乱，配置其只显示文件名
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" make tabline in terminal mode
function! Vim_NeatTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'
        " the label is made by MyTabLabel()
        let s .= ' %{Vim_NeatTabLabel(' . (i + 1) . ')} '
    endfor
    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'
    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999XX'
    endif
    return s
endfunc

" get a single tab name
function! Vim_NeatBuffer(bufnr, fullname)
    let l:name = bufname(a:bufnr)
    if getbufvar(a:bufnr, '&modifiable')
        if l:name == ''
            return '[No Name]'
        else
            if a:fullname
                return fnamemodify(l:name, ':p')
            else
                return fnamemodify(l:name, ':t')
            endif
        endif
    else
        let l:buftype = getbufvar(a:bufnr, '&buftype')
        if l:buftype == 'quickfix'
            return '[Quickfix]'
        elseif l:name != ''
            if a:fullname
                return '-'.fnamemodify(l:name, ':p')
            else
                return '-'.fnamemodify(l:name, ':t')
            endif
        else
        endif
        return '[No Name]'
    endif
endfunc

" get a single tab label
function! Vim_NeatTabLabel(n)
    let l:buflist = tabpagebuflist(a:n)
    let l:winnr = tabpagewinnr(a:n)
    let l:bufnr = l:buflist[l:winnr - 1]
    return Vim_NeatBuffer(l:bufnr, 0)
endfunc

" setup new tabline
set tabline=%!Vim_NeatTabLine()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快速切换标签页
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><tab>n :tabn<CR>
nnoremap <silent><tab>p :tabp<CR>
nnoremap <silent><leader>t :tabnew<CR>
nnoremap <silent><leader>c :tabclose<CR>
nnoremap <silent><leader>1 :tabn 1<CR>
nnoremap <silent><leader>2 :tabn 2<CR>
nnoremap <silent><leader>3 :tabn 3<CR>
nnoremap <silent><leader>4 :tabn 4<CR>
nnoremap <silent><leader>5 :tabn 5<CR>
nnoremap <silent><leader>6 :tabn 6<CR>
nnoremap <silent><leader>7 :tabn 7<CR>
nnoremap <silent><leader>8 :tabn 8<CR>
nnoremap <silent><leader>9 :tabn 9<CR>
nnoremap <silent><s-tab> :tabnext<CR>
inoremap <silent><s-tab> <ESC>:tabnext<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" all kinds of mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 底行模式下，按下%%时自动展开为当前活动缓冲区的路径
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
" 插入模式下，按下jj相当于esc
inoremap jj <esc>
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><C-h> <C-w>h
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下设置来自于vim内置文档的推荐设置，执行:h cscope查阅
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif

" 查找C语言符号，即函数名、宏、枚举值等
nnoremap <F2> :cs f s <C-R>=expand("<cword>")<CR><CR>
" 查找指定的字符串
nnoremap <F3> :cs f t <C-R>=expand("<cword>")<CR><CR>
" 查找调用本函数的函数
nnoremap <F4> :cs f c <C-R>=expand("<cword>")<CR><CR>
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
" Plug 'Valloric/YouCompleteMe'
" Plug 'mhinz/vim-startify'
" Plug 'easymotion/vim-easymotion'
" Plug 'preservim/nerdtree'
" Plug 'preservim/nerdcommenter'
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
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" 配置ctags的参数
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" 检测 ~/.cache/tags 不存在就新建
" if !isdirectory(s:vim_tags)
"    silent! call mkdir(s:vim_tags, 'p')
" endif
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
" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p
" 打开/关闭NERDTree窗口
" nnoremap <F5> :NERDTreeToggle<CR>
" inoremap <F5> <ESC>:NERDTreeToggle<CR>
" 定位当前活动缓冲区
" nnoremap <F6> :NERDTreeFind<CR>
" inoremap <F6> <ESC>:NERDTreeFind<CR>
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
" 打开MRU列表
" nnoremap <silent><leader>m :LeaderfMru<CR>
" nnoremap <silent><leader>r :LeaderfRgInteractive<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
