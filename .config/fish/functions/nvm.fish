# Install `bass` using `fisherman`.
# Fisherman: https://github.com/fisherman/fisherman
# Bass: https://github.com/edc/bass
function nvm
  bass source $BREW_HOME/opt/nvm/nvm.sh --no-use ';' nvm $argv
end

