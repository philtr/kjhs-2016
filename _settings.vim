"//////////////////////////////////////////////////////////////////////////////////////////////////
" NOTE: This file is a modified version of my vim configuration specifically
"       tailored to this presentation. To see my actual configuration, please
"       visit https://github.com/philtr/dotfiles/tree/master/vim/settings/vimrc
"
"//////////////////////////////////////////////////////////////////////////////////////////////////
"               __   _(_)_ __ ___          _ __ | |__ (_) | |_ _ __
"               \ \ / / | '_ ` _ \  _____ | '_ \| '_ \| | | __| '__|
"                \ V /| | | | | | | _____ | |_) | | | | | | |_| |
"                 \_/ |_|_| |_| |_|       | .__/|_| |_|_|_|\__|_|
"= Initial setup =========================|_|======================================================

  set nocompatible    " Backwards compatibility with Vi is not a priority
  set encoding=utf8   " use UTF-8 encoding for the win

"= Plug.vim =======================================================================================

  " A minimalist Vim plugin manager.
  " See https://github.com/junegunn/vim-plug for more information

  call plug#begin()

  " General purpose plugins that should always be loaded ------------------------------------------

    Plug 'benmills/vimux'                   " Run commands in a tmux split
    Plug 'christoomey/vim-tmux-navigator'   " Navigate seamlessly between vim and tmux splits
    Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file search within current directory
    Plug 'scrooloose/syntastic'             " Check buffer for syntax errors when saving
    Plug 'tpope/vim-commentary'             " Easy code commenting
    Plug 'chrisbra/NrrwRgn'                 " Open a new buffer with the current visual block
    Plug 'rking/ag.vim'                     " Superfast code searching

  " Language/Filetype plugins ---------------------------------------------------------------------

    Plug 'othree/html5.vim'       " HTML5 syntax highlighting
    Plug 'slim-template/vim-slim' " Slim syntax support
    Plug 'thoughtbot/vim-rspec'   " Run RSpec tests with simple commands
    Plug 'tpope/vim-bundler'      " Bundler syntax & utilities
    Plug 'tpope/vim-haml'         " HAML syntax highlighting
    Plug 'tpope/vim-markdown'     " Markdown syntax highlighting (incl. fenced code blocks)
    Plug 'tpope/vim-rake'         " Rake syntax & utilities
    Plug 'tpope/vim-rails'        " Rails syntax & utilities
    Plug 'vim-ruby/vim-ruby'      " Ruby syntax highlighting and more

  " Appearance plugins ----------------------------------------------------------------------------

    " Plug 'chriskempson/base16-vim'        " Base16 color scheme for vim
    Plug 'snooc/base16-vim'                 "   ↑ Forked with updated themes
    Plug 'airblade/vim-gitgutter'           " Display git status information in the gutter
    Plug 'lilydjwg/colorizer'               " Colorize colo strings, e.g. #aabbcc
    Plug 'scrooloose/nerdtree'              " Handy folder tree
    Plug 'Yggdroot/indentLine'              " Indentation guides

    Plug 'ryanoasis/vim-devicons'           " Nerdy icons everywhere! (Always load this last)

  call plug#end()

"= Interface ======================================================================================

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

"= Utilities ======================================================================================

  set nobackup                 " don't create backup files
  set nowb                     " don't make a backup before overwriting a file
  set directory=~/.vim/swap//  " put swap files in ~/.vim/undo/pat%to$file.ext.swp
  set undodir=~/.vim/undo//    " put undo files in ~/.vim/undo/path%to$file.ext

"= Keys ===========================================================================================

  let mapleader = ','                     " Fearless leader!

  " Tab Navigation
  nmap <Leader>l :tabnext<CR>
  nmap <Leader>h :tabprevious<CR>

  " Folding
  nmap <Leader>F :set foldmethod=syntax<CR>

  " Transpose the line(s) under the cursor one line down
  nmap <Leader>k ddp
  " Transpose the line(s) under the cursor one line up
  nmap <Leader>K ddkP
  " Transpose character(s) under the cursor one position to the right
  nmap <Leader>x xp
  " Transpose character(s) under the cursor one position to the left
  nmap <Leader>X xhP

"= Theme ==========================================================================================

  set background=dark
  colorscheme base16-default

  set hlsearch                            " highlight all search matches
  set colorcolumn=80,100,120              " visual indicator at columns 80, 100, 120

  set list listchars=tab:██,trail:∙       " Use "██" for tabs and "∙" for trailing spaces
  set fillchars+=vert:                    " set vertical fillchar to "en space" (it's there, trust

"= File Types =====================================================================================

  au BufRead,BufNewFile *.brs setf vb           " Use VBScript for BrightScript files
  au BufRead,BufNewFile *.md  setf markdown     " Use Markdown for .md files
  au BufRead,BufNewFile *.jbuilder setf ruby    " Use Ruby for .jbuilder files

"= CtrlP ==========================================================================================

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

  " Keymappings -----------------------------------------------------------------------------------

    nmap <Leader>p <C-p>
    nmap <Leader>P :CtrlPClearAllCaches<CR><C-p>
    nmap <Leader>b :CtrlPBuffer<CR>

"= GitGutter ======================================================================================

  let g:gitgutter_enabled = 0           " Disable by default
  let g:gitgutter_map_keys = 0          " Don't use built-in key mappings
  let g:gitgutter_highlight_lines = 1   " Highlight lines that are part of the diff

  nmap <Leader>gg :GitGutterToggle<CR>

"= IndentLine =====================================================================================

  let g:indentLine_enabled = 0            " Disable by default
  let g:indentLine_char = ''             " Use a fancy character to indicate an indent level
  let g:indentLine_concealcursor = 'vc'   " Don't show indent guides for current line

  nmap <Leader>ig :IndentLinesToggle<CR>

"= Markdown =======================================================================================

  let g:markdown_fenced_languages = [
    \ 'css',
    \ 'erb=eruby',
    \ 'javascript', 'js=javascript', 'json=javascript',
    \ 'ruby',
    \'sass'
  \]

"= NERDTree =======================================================================================

  let NERDTreeQuitOnOpen = 1  " Hide NERDTree when opening a file
  let NERDTreeShowHidden = 1  " Show hidden files

  nmap <Leader>n :NERDTreeToggle<CR>

"= RSpec.vim ======================================================================================

  let g:rspec_command = 'VimuxRunCommand "bundle exec rspec {spec}"'

  map <Leader>ss :call RunCurrentSpecFile()<CR>
  map <Leader>sn :call RunNearestSpec()<CR>
  map <Leader>sl :call RunLastSpec()<CR>
  map <Leader>sa :call RunAllSpecs()<CR>

  map <F8> :VimuxRunLastCommand<CR>

"= Syntastic ======================================================================================

  let g:syntastic_always_populate_loc_list = 1    " Put syntax errors into the location list
  let g:syntastic_auto_loc_list = 0               " Don't pop up the location list on syntax errors
  let g:syntastic_check_on_wq = 0                 " Don't check syntax when quitting
  let g:check_on_open = 0                         " Don't check syntax when opening a file
  let g:syntastic_loc_list_height = 5             " Smaller location list

  let g:syntastic_ruby_checkers = ['rubocop', 'mri']  " Enable RuboCop for Ruby

  nmap <Leader>sx :SyntasticCheck<CR>
  nmap <Leader>sxt :SyntasticToggleMode<CR>

" Other

" highlight the foldcolumn with normal colors
hi! link FoldColumn Normal
set foldcolumn=3

"==================================================================================================
