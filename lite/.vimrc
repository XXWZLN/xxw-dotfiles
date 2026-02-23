" ============================================================================
" 一个简单但强大的 Vim 配置
" ============================================================================
" --- 核心功能 ---
syntax on               " 开启语法高亮
set number              " 显示行号
" set cursorline          " 高亮显示当前行
" --- 改善搜索 ---
set incsearch           " 边输入边搜索（增量搜索）
set hlsearch            " 高亮所有搜索匹配项
set ignorecase          " 搜索时忽略大小写
set smartcase           " 如果搜索词中包含大写字母，则不忽略大小写
" --- 缩进和制表符 ---
set tabstop=4           " Tab 键的宽度为 4 个空格
set shiftwidth=4        " 自动缩进的宽度为 4 个空格
set softtabstop=4       " 按下 Tab 键时，实际插入的空格数
set expandtab           " 将 Tab 自动转换为空格（强烈推荐）
" --- 界面和体验 ---
set showcmd             " 在右下角显示未完成的命令
set mouse=a             " 启用鼠标支持（所有模式）
set encoding=utf-8      " 设置文件编码为 UTF-8
" --- 括号匹配 ---
set showmatch           " 高亮显示匹配的括号
" --- 应用系统剪切板, y 直接复制选中内容 ---
set clipboard=unnamed

call plug#begin()

" List your plugins here
Plug 'preservim/nerdcommenter'

call plug#end()

" 注释后空一格
let g:NERDSpaceDelims = 1

" 禁止回车或 o/O 时自动延续注释
autocmd FileType * setlocal formatoptions-=r formatoptions-=o
