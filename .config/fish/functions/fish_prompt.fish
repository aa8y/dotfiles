# Powerline Go
# Install: brew install powerline-go
# Ref: https://github.com/justjanne/powerline-go?tab=readme-ov-file#installation
#
# Powerline fonts
# Ref: https://github.com/powerline/fonts
function fish_prompt
  powerline-go -error $status -jobs (count (jobs -p))
end
