if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'wlangstroth/vim-racket'
Plug 'tomasr/molokai'

call plug#end()

" Misc settings
set nocompatible                      " Don't try to be vi-friendly
filetype on                           " Filetype detection
filetype plugin on                    " Filetype plugins
filetype indent on                    " Filetype-based indentation
syntax on                             " Enable syntax highlighting
set t_Co=256                          " Use 256 colours
set background=dark                   " For terminals with a light or dark
colorscheme molokai                   " Yep
set nobackup noswapfile nowritebackup " Prevent backup and autosave files from happening
set nowrap                            " Don't wrap lines
set nomodeline                        " Modelines are a security hazard
set ruler                             " Show the cursor position at all times
set hlsearch                          " Highlight search candidates
set incsearch                         " Highlight search results while typing
set backspace=indent,eol,start        " Make backspace behave more like backspace?
set ignorecase                        " Enable case-insensitive searching
set showmatch                         " Highlight matching parentheses
set autoindent                        " Apply the indentation of the current line to the next line
set textwidth=80                      " Maximum width before text is wrapped
set expandtab                         " Insert spaces instead of tabs
set tabstop=2                         " Maximum width of a tab character for when they are real tabs
set shiftwidth=2                      " Number of spaces to use for each step of (auto)indent.
set mouse=a

" Get rid of trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

" Remove highlights with spacebar
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Limit amount of memory used for pattern matching to 5000kb, so typing a [
" before a Markdown link doesn't cause bigger files to freeze
set mmp=5000

" Avoid collapsed highlight for larger fenced code blocks
let g:markdown_minlines=100

"highlight markdownCode ctermfg=green
highlight Normal ctermbg=0
"highlight comment ctermfg=59

fun! MyHighlights()
    syntax match Todos /\%(\ctodo\)/
    syntax match Dones /\%(\cdone\)/
    highlight Todos ctermbg=yellow ctermfg=black
    highlight Dones ctermbg=green ctermfg=black
endfu
autocmd BufReadPost * call MyHighlights()

fun! HighlightBadWords()
    syn match badWords /\%(\cblacklist\)\|\
                        \%(\cwhitelist\)\|\
                        \%(\cbuyer\)\|\
                        \%(\cfront line\)\|\
                        \%(\cgrandfather\)\|\
                        \%(\c able\)\|\
                        \%(\cmay\)\|\
                        \%(\cmust\)\|\
                        \%(\c once\)\|\
                        \%(^\conce\)\|\
                        \%(\csee \)\|\
                        \%(\csince\)\|\
                        \%(\csunset\)\|\
                        \%(\cdropdown\)\|\
                        \%(\cdepreciat\)\|\
                        \%(\cdeprecat\)/
    highlight badWords ctermbg=red ctermfg=black
endfu
autocmd bufenter,filetype *.txt,*.md :call HighlightBadWords()

fun! SetWritingMode()
    noremap j gj
    noremap k gk
    noremap $ g$
    noremap ^ g^
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal spell
    setlocal textwidth=0
    setlocal wrapmargin=0
    setlocal wrap
    " This makes copy and pasting annoying because it will add extra spaces
    " after the words at the end, but makes eading nicer :shrug:
    " setlocal linebreak
endfu
autocmd bufenter,filetype *.txt,*.md :call SetWritingMode()

