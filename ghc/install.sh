#! /usr/bin/env bash
D="$HOME/.ghc"
source ../installEnv.sh
installFile2Dir ghci.conf "$D"
installDotFile haskeline "$HOME"

cabal install hoogle
cabal install shellcheck
cabal install ghc-mode
cabal install hdevtools
cabal install hlint
cabal install pointfree
cabal install hasktags
