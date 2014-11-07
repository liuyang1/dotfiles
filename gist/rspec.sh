fullfile=$1
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

cmd=""
rspec() {
    ext="$1"
    filename="$2"
    case "$ext" in
        py*) cmd="python2 $filename" ;;
        sh*) cmd="bash $filename" ;;
        scm*) cmd="guile $filename" ;;
        c*|cpp*) cmd="gcc $filename && ./a.out" ;;
        clj*) cmd="clojure $filename" ;;
        cl*) cmd="clisp $filename" ;;
        Xresouces*) cmd="xrdb $filename" ;;
        dot) cmd="dot $filename -Tpng:cairo:cairo -o test.png && eog test.png" ;;
        # dot) cmd="dot $filename -Tpng -o test.png && eog test.png" ;;
        sml) cmd="sml $filename" ;;
        rkt) cmd="racket hw4test.rkt" ;;
        *) cmd="echo unknown filetype" ;;
    esac
}

rspec $extension $fullfile
eval "$cmd"
