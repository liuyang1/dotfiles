#! /usb/bin/env bash

# MUST exec this script as SOURCE mode.
# as subshell not inheritance terminal env var.
echo "$@" "$COLUMNS" "$LINES" >> termsize.log
