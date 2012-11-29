#!/bin/sh

cabal clean 2>&1 || exit 1
cabal configure --enable-tests 2>&1 || exit 2
echo ""
echo "building:"
cabal build 2>&1 || exit 3
echo ""
echo "tests:"
cabal test 2>&1 || exit 4
echo ""
echo "hlint:"
hlint src testsuite 2>&1 || exit 5

