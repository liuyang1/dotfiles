repo forall -c "git reset --hard; git clean -dxf; rm -rf .git/rebase-*"
repo sync -d -j16
pushd "$HOME/.local/gtv"
./install.sh
popd
