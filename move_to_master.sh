#!/bin/bash
echo $ git pull
git pull || exit 1

echo
echo $ git checkout origin/master 
git checkout origin/master || exit 1

echo
echo $ git status -uno
git status -uno

echo
echo $ ./apply_patches.sh
./apply_patches.sh || exit 1

echo
echo $ ./recompile.sh
./recompile.sh || exit 1

echo
echo "We're done here :)"
