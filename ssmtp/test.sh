to='user@mail.com'
from='user@mail.com' # from must be same with SSMTP config
echo "test mail content" | mail -s test_mail "$to" -aFrom:"$from"
