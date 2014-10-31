fullfile=$1
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

cmd=""
rspec() {
    ext="$1"
    filename="$2"
    case "$ext" in
        py*)
            cmd="python2 $filename"
            ;;
        sh*)
            cmd="bash $filename"
            ;;
        scm*)
            cmd="guile $filename"
            ;;
        c*|cpp*)
            cmd="gcc $filename"
            ;;
        clj*)
            cmd="clojure $filename"
            ;;
        cl*)
            cmd="clisp $filename"
            ;;
        Xresouces*)
            cmd="xrdb $filename"
            ;;
        dot*)
            cmd="dot $filename -Tpng -o test.png && feh test.png"
    esac
}

rspec $extension $fullfile
echo $cmd
eval "$cmd"
