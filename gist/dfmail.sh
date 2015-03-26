disk="sda2"
admin="admin@mail.com"
s=$(df | grep "$disk" | awk '{print $5}' )
s="${s%%%}"
mail () {
    echo "df size greater than 95" | mail -s "df notify" "$admin"
}
[[ (( $s -gt 95 )) ]] && mail
