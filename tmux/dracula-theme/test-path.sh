#!/usr/bin/env bash

# Test script for current-path.sh
# Usage: ./test-path.sh <directory>

test_dir="${1:-$PWD}"

# Simulate tmux options
style="smart"
markers=".git .repo .hg"
collapse_after=2
keep_tail=2

current_path="$test_dir"

# Replace HOME with ~
display_path="${current_path/#$HOME/\~}"

case "$style" in
    basename)
        basename "$current_path"
        ;;
    full)
        echo "$display_path"
        ;;
    smart)
        # Find anchor by searching upward for marker files
        anchor_dir=""
        anchor_name=""
        search_dir="$current_path"
        
        while [[ "$search_dir" != "/" && "$search_dir" != "$HOME" && -n "$search_dir" ]]; do
            # Check for marker files
            for marker in $markers; do
                if [[ -e "$search_dir/$marker" ]]; then
                    anchor_dir="$search_dir"
                    anchor_name=$(basename "$search_dir")
                    break 2
                fi
            done
            search_dir=$(dirname "$search_dir")
        done
        
        if [[ -n "$anchor_name" ]]; then
            # Calculate relative path from anchor
            rel_path="${current_path#$anchor_dir}"
            rel_path="${rel_path#/}"
            
            if [[ -z "$rel_path" ]]; then
                # At anchor root
                echo "[$anchor_name]"
            else
                # Count depth after anchor
                IFS='/' read -ra rel_parts <<< "$rel_path"
                rel_depth=${#rel_parts[@]}
                
                if [[ $rel_depth -le $collapse_after ]]; then
                    # Shallow: show full relative path
                    echo "[$anchor_name]/$rel_path"
                else
                    # Deep: collapse middle, keep tail
                    tail_path=""
                    for ((i=rel_depth-keep_tail; i<rel_depth; i++)); do
                        if [[ -z "$tail_path" ]]; then
                            tail_path="${rel_parts[$i]}"
                        else
                            tail_path="$tail_path/${rel_parts[$i]}"
                        fi
                    done
                    echo "[$anchor_name] …/$tail_path"
                fi
            fi
        else
            # Fallback: no anchor found, show last few components
            IFS='/' read -ra parts <<< "$display_path"
            depth=${#parts[@]}
            
            if [[ $depth -le 3 ]]; then
                echo "$display_path"
            else
                echo "…/${parts[$((depth-3))]}/${parts[$((depth-2))]}/${parts[$((depth-1))]}"
            fi
        fi
        ;;
    *)
        basename "$current_path"
        ;;
esac
