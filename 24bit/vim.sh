# download newest vim code
# git clone https://github.com/vim/vim.git

# download vim code, and switch to 24-bit-xterm branch
downSrc() {
    hg clone ssh://hg@bitbucket.org/ZyX_I/vim
    pushd vim
    hg bookmark 24-bit-xterm
}

build() {
    ./configure --with-features=huge \
        --enable-multibyte \
        --enable-rubyinterp \
        --enable-pythoninterp \
        --enable-python3interp \
        --enable-perlinterp \
        --enable-luainterp \
        --enable-termtruecolor \
        --enable-autoservername \
        --with-python-config-dir=/usr/lib/python2.7/config \
        --enable-gui=gtk2 --enable-cscope --prefix=/usr
    # make VIMRUNTIMEDIR=/usr/share/vim/vim74
    make

    # sudo make install

    ./vim --version | grep color
}

# How to use it.
# source 24bit.vim to use it.

# Issue
# make sure clean pre-installed vim, or overwrite it.
