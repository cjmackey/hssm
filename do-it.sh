#!/bin/sh

cabal clean || exit 1
cabal configure --enable-tests || exit 2
echo ""
echo "building:"
cabal build || exit 3
echo ""
echo "tests:"
cabal test || exit 4
echo ""
echo "hlint:"
hlint src testsuite || exit 5


