#! /usr/bin/env bash
source ../installEnv.sh

PREFIX=~/.local/bin

installFile2Dir repoclean.sh    $PREFIX
installFile2Dir fixMod.sh     $PREFIX
installFile2Dir test256.pl    $PREFIX
installFile2Dir cfgscr.sh $PREFIX
installFile findFile.sh   $PREFIX/ff
installFile rspec.sh            $PREFIX/rspec
installFile2Dir ldgfmt.py $PREFIX
chmod +x $PREFIX/ldgfmt.py
