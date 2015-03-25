vv ()
{
    if [[ "$1" == "" ]]; then
        key="$lastvv"
    else
        key="$1"
        export lastvv="$1"
    fi
    vim -c "Ack '$key'"
}
vc ()
{
    ag "$1" > /tmp/vv.tmp
    vim -q /tmp/vv.tmp -c "cw"
}
