# download code
download() {
    git clone git://github.com/spudowiar/rxvt-unicode.git
}

patch() {
  # patch list
  # font-width-fix.patch
  # line-spacing-fix.patch
  # truecolor.patch
  true;
}

build() {
  # cd $_pkgname-$pkgver
  # for p in "${_patches[@]}"; do
  #   echo "=> $p"
  #   patch -p0 -i ../$p || return 1
  # done
  ./configure \
    --prefix=/usr \
    --with-terminfo=/usr/share/terminfo \
    --enable-256-color \
    --enable-24-bit-color \
    --enable-combining \
    --enable-fading \
    --enable-font-styles \
    --enable-iso14755 \
    --enable-keepscrolling \
    --enable-lastlog \
    --enable-mousewheel \
    --enable-next-scroll \
    --enable-perl \
    --enable-pixbuf \
    --enable-pointer-blank \
    --enable-rxvt-scroll \
    --enable-selectionscrolling \
    --enable-slipwheeling \
    --enable-smart-resize \
    --enable-startup-notification \
    --enable-transparency \
    --enable-unicode3 \
    --enable-utmp \
    --enable-wtmp \
    --enable-xft \
    --enable-xim \
    --enable-font-styles \
    --enable-text-blink \
    --enable-pointer-blank \
    --enable-8bitctrls \
    --enable-fallback \
    --enable-xterm-scroll \
    --disable-frills
  make
}
