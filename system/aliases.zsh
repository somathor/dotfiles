# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null); then
  alias l='gls -lAh --color'
  alias la='gls -A --color'
  alias ll='gls -l --color'
  alias ls='gls -F --color'
else
  alias ls='ls --color'
fi
