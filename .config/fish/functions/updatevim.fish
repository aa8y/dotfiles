# Non POSIX Shell workaround for Vundle
# https://github.com/gmarik/Vundle.vim/wiki#faq4
#
# For a fresh start run the following first.
# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

function updatevim
  set -lx SHELL (which sh)
  vim +BundleInstall +BundleClean +qall
end
