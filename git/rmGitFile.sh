f="$1"
# TODO: need test
git filter-branch --force --index-filter \'git rm --cached --ignore-unmatch "$f"\' --prune-empty --tag-name-filter cat -- --all
rm -rf .git/refs/original
git gc --prune=now
git gc --aggressive --prune=now
