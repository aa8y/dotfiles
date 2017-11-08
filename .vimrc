" Since Vim need a POSIX compliant shell and fish is, well, not.
" Refer: https://github.com/dag/vim-fish#teach-a-vim-to-fish
if &shell =~# 'fish$'
  set shell=sh
endif

"============================================================================"
" BEGIN VUNDLE SETUP
"============================================================================"
" Refer: https://github.com/VundleVim/Vundle.vim#quick-start

" To make sure the .vimrc behaves as it should when -u is used to load it.
" Refer: http://stackoverflow.com/a/22543937/1379599
" Also, required for Vundle.
set nocompatible

" Required for Vundle to work, will be turned on later.
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Vundle plugins to be added here.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Docker
Plugin 'ekalinin/Dockerfile.vim'
" Fish scripting
Plugin 'dag/vim-fish'
" Javascript ES6
Plugin 'isRuslan/vim-es6'
" JSON
Plugin 'elzr/vim-json'
" Markdown: Syntax-highlighting, rules matching and mapping.
Plugin 'plasticboy/vim-markdown'
" Pug (formerly Jade) templating engine
Plugin 'digitaltoad/vim-pug'
" SBT
Plugin 'derekwyatt/vim-sbt'
" Scala
Plugin 'derekwyatt/vim-scala'
" Terraform
Plugin 'hashivim/vim-terraform'
" Vim thin tabline/status.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" All of your Plugins must be added before the following line.
call vundle#end()            " required

" Enable loading the indent file for specific file types.
" Refer: http://vimdoc.sourceforge.net/htmldoc/filetype.html
" Required for vim-fish.
" Refer: https://github.com/dag/vim-fish#features-aplenty
" And also for Vundle.
filetype plugin indent on

" Name of the shell to use for ! and :! commands.
" Refer: http://vimdoc.sourceforge.net/htmldoc/options.html#%27shell%27
" Required for Vundle installation and for vim-instant-markdown to work
" properly.
set shell=bash\ -i

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Brief help
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  _________________________________________________________________________
" | Value             | Effect                                              |
" |___________________|_____________________________________________________|
" |:PluginList        | lists configured plugins                            |
" |:PluginInstall     | installs plugins; append `!` to update or just      |
" |:PluginUpdate      |                                                     |
" |:PluginSearch foo  | searches for foo; append `!` to refresh local cache |
" |:PluginClean       | confirms removal of unused plugins; append `!` to   |
" |                   | auto-approve removal                                |
" |___________________|_____________________________________________________|
" see :h vundle for more details or wiki for FAQ

"============================================================================"
" END VUNDLE SETUP
"============================================================================"

" Switch on syntax highlighting. Use `on` instead to override your setting
" with the default settings.
" Refer: http://vimdoc.sourceforge.net/htmldoc/syntax.html
syntax enable

"============================================================================"
" BEGIN SETTING OPTIONS
"============================================================================"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For documentation on any option.
" Refer: http://vimdoc.sourceforge.net/htmldoc/options.html#%27<option>%27
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allow backspace to delete all characters, hence making it behave like most
" applications.
"  _________________________________________________________________________
" | Value  | Effect                                                         |
" |________|________________________________________________________________|
" | indent | Allow backspacing over autoindent.                             |
" | eol    | Allow backspacing over line breaks (join lines).               |
" | start  | Allow backspacing over the start of insert; CTRL-W and CTRL-U  |
" |        | stop once at the start of insert.                              |
" |________|________________________________________________________________|
" For backwards compatibility with version 5.4 and earlier,
" set it to 2, which is same as the option below.
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set number of columns a tab counts for.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Number of spaces that a <Tab> in the file counts for.
set tabstop=2

" Hitting `Tab` in insert mode will produce the number of spaces specified in
" `tabstop`.
set expandtab

" Number of columns text is indented with on (auto|re)indent operations.
set shiftwidth=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set auto-indentation on by default.
set autoindent

" Show the line and column number of the cursor position, separated by a comma
" in the bottom-right corner of the screen.
set ruler

" Supress error noises.
set visualbell t_vb=

" Disable code folding, which is how vim-fish and vim-markdown behave by
" default.
set nofoldenable

" Install fonts from: https://github.com/powerline/fonts
" Select the font to use in your terminal profile.
" Eg. Ubuntu Mono Derivative powerline Regular
let g:airline_powerline_fonts=1

"============================================================================"
" END SETTING OPTIONS
"============================================================================"

"============================================================================"
" BEGIN KEY MAPPINGS
"============================================================================"

" `F5`: Remove all trailing whitespace.
" Refer: http://vi.stackexchange.com/a/2285
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"============================================================================"
" END KEY MAPPINGS
"============================================================================"
