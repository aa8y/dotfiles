# Non POSIX Shell workaround for Vundle
# https://github.com/gmarik/Vundle.vim/wiki#faq4

function updatevim
  set -lx SHELL (which sh)
  vim +BundleInstall +BundleClean +qall
end
