#! /usr/bin/env bash
source ../installEnv.sh

PREFIX=~/.local/bin

installFile2Dir repoclean.sh    $PREFIX
installFile2Dir ./fixMod.sh     $PREFIX
installFile2Dir ./test256.pl    $PREFIX

