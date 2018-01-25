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
installFile2Dir alter.sh    $PREFIX
installFile2Dir clip.sh $PREFIX
installFile2Dir clipTime.sh $PREFIX

installFile2Dir OK_xm.mp3 $PREFIX/../share/
chmod +x $PREFIX/ldgfmt.py
