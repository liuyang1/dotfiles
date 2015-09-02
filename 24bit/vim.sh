git clone https://github.com/vim/vim.git

hg clone ssh://hg@bitbucket.org/ZyX_I/vim
hg bookmark 24-bit-xterm

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-python3interp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-termtruecolor \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
make

sudo make install

vim --version | grep color

# How to use it.
# source 24bit.vim to use it.
