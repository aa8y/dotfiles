# Install `bass` using `fisher`.
# Fisher: https://github.com/jorgebucaran/fisher
# Bass: https://github.com/edc/bass
function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end

