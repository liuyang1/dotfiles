PWD=`pwd`
find $PWD -type d -print0 | xargs -0 chmod 755
find $PWD -type f -print0 | xargs -0 chmod 644
