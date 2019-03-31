"=================================================================================================="
" INDENTATION
"=================================================================================================="
" Ref: https://github.com/aki017/vimrc/blob/master/indent.vimrc

" Set auto-indentation on by default
set autoindent
" When starting a new line, make the new line indent the same amount as the current line
set smartindent

" shiftwidth  Number of columns text is indented with on (auto|re)indent operations
" softtabstop Number of spaces inserted when the <Tab> key is pressed. If it's set to 0, it's the
"             same as tabstop
" tabstop     Number of spaces that a <Tab> in the file counts for
set tabstop=2 shiftwidth=2 softtabstop=0

if has("autocmd")
  " Enable file type search
  filetype plugin on
  " Use indentation that matches the file type
  filetype indent on
  " Disable auto-indentation on these file types
  " autocmd FileType php filetype indent off

  " Override indentation for the following file types
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
endif
