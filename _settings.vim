set nocompatible    " Backwards compatibility with Vi is not a priority
set encoding=utf8   " use UTF-8 encoding for the win

call plug#begin()

  Plug 'benmills/vimux'                   " Run commands in a tmux split
  Plug 'christoomey/vim-tmux-navigator'   " Navigate seamlessly between vim and tmux splits
  Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file search within current directory
  Plug 'tpope/vim-commentary'             " Easy code commenting
  Plug 'rking/ag.vim'                     " Superfast code searching

  Plug 'othree/html5.vim'       " HTML5 syntax highlighting
  Plug 'tpope/vim-markdown'     " Markdown syntax highlighting (incl. fenced code blocks)
  Plug 'vim-ruby/vim-ruby'      " Ruby syntax highlighting and more

  " Plug 'chriskempson/base16-vim'        " Base16 color scheme for vim
  Plug 'snooc/base16-vim'                 "   ↑ Forked with updated themes

call plug#end()

" Appearance ------------------------------------------------------------------------------------

syntax on                    " turn on syntax highilghting

filetype plugin on           " enable loading plugins for filetypes
filetype indent on           " enable loading 'indent files' for filetypes

set cursorline               " highlight line under cursor
set synmaxcol=200            " no syntax highlighting for lines longer than 100 cols
set laststatus=0             " don't show status bar
set showtabline=0            " don't show tab bar
set nonumber                 " don't display line numbers
set visualbell               " use visual bell
set t_ut=                    " disable background color erase


" Interaction -----------------------------------------------------------------------------------

let loaded_match_paren = 1      " highlight matching parens

set autoread                    " automatically reload unmodified buffers when edited externally
set ttyfast                     " improve screen refresh for terminal vim
set scrolloff=0                 " start scrolling 3 lines from bottom
set sidescrolloff=0             " start scrolling 6 lines from right
set mouse=a                     " allow mouse usage
set clipboard=unnamed           " use the system clipboard
set backspace=indent,eol,start  " Make backspace behave as expected

" Wrapping --------------------------------------------------------------------------------------

set nowrap                   " don't softwrap text
set formatoptions-=t         " don't automatically hardwrap text (use 'gq' to reflow text)
set textwidth=80             " wrap at column 80
set wrapmargin=0             " don't wrap based on terminal size

" Indentation -----------------------------------------------------------------------------------

set autoindent               " indent next line to same level as current line
set smartindent              "   ↑ but do it smartly
set smarttab                 " <Tab> in front of a line inserts 'shiftwidth' blanks
set shiftwidth=2             "   ↑ use 2 blanks for above
set tabstop=2                " display a <Tab> as 2 spaces
set softtabstop=2            " use 2 spaces for a <Tab>
set expandtab                "   ↑ insert spaces when <Tab> key is ressed

" Utilities ---------------------------------------------------------------------------------------

set nobackup                 " don't create backup files
set nowb                     " don't make a backup before overwriting a file
set directory=~/.vim/swap//  " put swap files in ~/.vim/undo/pat%to$file.ext.swp
set undodir=~/.vim/undo//    " put undo files in ~/.vim/undo/path%to$file.ext

" Keys --------------------------------------------------------------------------------------------

let mapleader = ','                     " Fearless leader!

" Tab Navigation
nmap <Leader>l :tabnext<CR>
nmap <Leader>h :tabprevious<CR>

" Presentation mode!
nmap <Space> :tabnext<CR>
nmap <Backspace> :tabprevious<CR>

" Transpose the line(s) under the cursor one line down
nmap <Leader>k ddp
" Transpose the line(s) under the cursor one line up
nmap <Leader>K ddkP
" Transpose character(s) under the cursor one position to the right
nmap <Leader>x xp
" Transpose character(s) under the cursor one position to the left
nmap <Leader>X xhP

nmap <Leader>p <C-p>
nmap <Leader>P :CtrlPClearAllCaches<CR><C-p>
nmap <Leader>b :CtrlPBuffer<CR>

nmap <F2> :set background=light<CR>:hi! link FoldColumn Normal<CR>:set foldcolumn=3<CR>:<CR>
nmap <F1> :set background=dark<CR>:hi! link FoldColumn Normal<CR>:set foldcolumn=3<CR>:<CR>

" Theme -------------------------------------------------------------------------------------------

set background=dark
colorscheme base16-default

set hlsearch                            " highlight all search matches
set colorcolumn=80,100,120              " visual indicator at columns 80, 100, 120

set list listchars=tab:██,trail:∙       " Use "██" for tabs and "∙" for trailing spaces
set fillchars+=vert:                    " set vertical fillchar to "en space" (it's there, trust

" highlight the foldcolumn with normal colors
hi! link FoldColumn Normal
set foldcolumn=3

" File Types --------------------------------------------------------------------------------------

au BufRead,BufNewFile *.brs setf vb           " Use VBScript for BrightScript files
au BufRead,BufNewFile *.md  setf markdown     " Use Markdown for .md files
au BufRead,BufNewFile *.jbuilder setf ruby    " Use Ruby for .jbuilder files

" CtrlP -------------------------------------------------------------------------------------------

let g:ctrlp_use_caching = 1           " Use caching
let g:ctrlp_clear_cache_on_exit = 0   " Persist cache across sessions
let g:ctrlp_show_hidden = 1           " Show hidden files

" Ignore specific files and folders
let g:ctrlp_custom_ignore = {
  \ 'dir': '(log|vendor/bundle|tmp|components/\.*/(vendor/bundle|tmp|spec/dummy|log))',
  \ 'file': '\v\.(jpg|png|gif|db)'
  \ }

" Ignore files in `.gitignore`
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

"- Markdown ---------------------------------------------------------------------------------------

let g:markdown_fenced_languages = [
  \ 'css',
  \ 'erb=eruby',
  \ 'javascript', 'js=javascript', 'json=javascript',
  \ 'ruby',
  \'sass'
\]
