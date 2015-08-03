#! /usr/bin/bash

# replace tab to whitespace
sed -i 's/\t/    /g' `grep "\t" -rl .`
# remove trailing whitespace
sed -i 's/[ \t]*$//' `grep " " -rl .`
