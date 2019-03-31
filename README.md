# Dotfiles

This is a repository of all the dotfiles that I need whenever I need to set up a new machine. References (with the tag `Ref`) have been added wherever external sources were referred to set up the dotfiles. Comments have also been added to explain the settings.

## [Fish Shell](https://fishshell.com)

Fish is a (relatively) modern shell that I use on all my machines. All settings for the shell are located in the `.config/fish` directory. The `.config/fish/functions` directory contains all the Fish shell functions, most of which are wrappers around bash-specific scripts. The `.config/fish/config.fish` file is global settings override file for the shell.

## Git

`.gitignore_global` is the global [`gitignore`](https://git-scm.com/docs/gitignore) which would apply to all Git projects.

## [Powerline Shell](https://github.com/b-ryan/powerline-shell)

Powerline Shell is a pretty and informative prompt generator. `.powerline-shell.json` determines the order in which the information is displayed on the prompt.

## [Scala](https://www.scala-lang.org)

`.scalafmt.conf` is the default [Scalafmt](https://scalameta.org/scalafmt) config file which I use in most of my Scala projects. This enables autoformatting of Scala source files based on the configuration rules. 

## [Vim](https://www.vim.org)

`.vimrc` is the Vim Script file which is used to override the default settings for Vim. `.vim/*.vimrc` are the files which contain settings which have been grouped into a category. For example, `.vim/indent.vimrc` contains file specific indentation settings and global overrides for indentation.
