#! /usr/bin/env bash
fullfile="$1"
dir=$(dirname "$fullfile")
cd "$dir"
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

cmd=""
rspec() {
    ext="$1"
    filename="$2"
    if [[ $filename == "Makefile"  ]]; then
        # cmd="make && make run"
        cmd="make -f $filename"
        return
    fi
    echo "$ext"
    case "$ext" in
        py*) cmd="python $filename" ;;
        sh*) cmd="bash $filename" ;;
        # scm*) cmd="guile $filename" ;;
        scm*|rkt) cmd="racket $filename" ;;
        c|cpp*|C*|h*|cxx*|cc*)
            if [[ -f Makefile ]]; then
                cmd="make && make run"
            else
                cmd="gcc $filename && ./a.out"
            fi 
            ;;
        clj*) cmd="clojure $filename" ;;
        cl*) cmd="clisp $filename" ;;
        Xresouces*) cmd="xrdb $filename" ;;
        dot) cmd="dot $filename -Tpng:cairo:cairo -o test.png && feh test.png" ;;
        # dot) cmd="dot $filename -Tpng -o test.png && eog test.png" ;;
        # circo.dot) cmd="circo $filename -Tpng:cairo:cairo -o test.png && feh test.png" ;;
        sml) cmd="sml $filename" ;;
        mk) cmd="make -f $filename" ;;
        uml) cmd="java -jar $HOME/.local/bin/plantuml.jar -pipe < $filename > test.png && feh test.png" ;;
        *) cmd="echo unknown filetype" ;;
    esac
}

if [[ -f rspec.sh ]]; then
    bash rspec.sh
else
    rspec "$extension" "$fullfile"
    echo "$cmd"
    eval "$cmd"
fi
