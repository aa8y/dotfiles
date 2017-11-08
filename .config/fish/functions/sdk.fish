# Make SDKMAN work in Fish Shell.
# Ref: http://tedwise.com/2016/02/26/using-sdkman-with-the-fish-shell

function sdk --description 'Software Development Kit Manager'
  bass source $HOME/.sdkman/bin/sdkman-init.sh ';' sdk $argv
end
