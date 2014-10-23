fullfile=$1
filename=$(basename "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

cmd=""
rspec() {
    ext="$1"
    case "$ext" in
        py*)
            cmd="python2"
            ;;
        sh*)
            cmd="bash"
            ;;
        scm*)
            cmd="mit-scheme --load"
            ;;
        c*|cpp*)
            cmd="gcc"
            ;;
        clj*)
            cmd="clojure"
            ;;
        cl*)
            cmd="clisp"
            ;;
        Xresouces*)
            cmd="xrdb"
            ;;
    esac
}

rspec $extension
eval "$cmd $fullfile"
