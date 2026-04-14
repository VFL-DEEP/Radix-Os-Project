make -j4
clear
make check
make install
cd ..
rm -Rf bison-3.8.2
clear
exit
clear
cd sources/
tar -xvf grep-3.12.tar.xz 
cd grep-3.12
clear
sed -i "s/echo/#echo/" src/egrep.sh
./configure --prefix=/usr
make -j4
make check
make install
cd ..
rm -Rf grep-3.12
exit
clear
cd sources/
tar -xvf bash-5.3.tar.gz 
cd bash-5.3
clear
./configure --prefix=/usr                         --without-bash-malloc                 --with-installed-readline             --docdir=/usr/share/doc/bash-5.3
clear
make -j4
chown -R tester .
clear
LC_ALL=C.UTF-8 su -s /usr/bin/expect tester << "EOF"
set timeout -1
spawn make tests
expect eof
lassign [wait] _ _ _ value
exit $value
EOF

clear
make install
clear
exec /usr/bin/bash --login
clear
exit
clear
cd sources/
tar -xvf libtool-2.5.4.tar.xz 
cd libtool-2.5.4
./configure --prefix=/usr
make
clear
make check
clear
make install
rm -fv /usr/lib/libltdl.a
clear
cd ..
rm -Rf libtool-2.5.4
exit
clear
cd sources/
clear
tar -xvf gdbm-1.26.tar.gz 
cd gdbm-1.26
clear
./configure --prefix=/usr                --disable-static             --enable-libgdbm-compat
make -j4
make check
clear
make install
clear
cd ..
rm -Rf gdbm-1.26
clear
exit
clear
cd sources/
ls
clear
tar -xvf gperf-3.3.tar.gz 
cd gperf-3.3
clear
./configure --prefix=/usr --docdir=/usr/share/doc/gperf-3.3
make -j4
clear
make check
clear
make install
cd ..
rm -Rf gperf-3.3
clear
exit
clear
cd sources/
clear
tar -xvf expat-2.7.1.tar.xz 
cd expat-2.7.1
clear
./configure --prefix=/usr                --disable-static             --docdir=/usr/share/doc/expat-2.7.1
make -j4
make check
make install
install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.7.1
cd ..
rm -Rf expat-2.7.1
exit
clear
cd sources/
tar -xvf inetutils-2.6.tar.xz 
cd inetutils-2.6
clear
sed -i 's/def HAVE_TERMCAP_TGETENT/ 1/' telnet/telnet.c
./configure --prefix=/usr                    --bindir=/usr/bin                --localstatedir=/var             --disable-logger                 --disable-whois                  --disable-rcp                    --disable-rexec                  --disable-rlogin                 --disable-rsh                    --disable-servers
make -j4
make install
clear
mv -v /usr/{,s}bin/ifconfig
clear
cd ..
rm -Rf inetutils-2.6
clear
exit
clear
neofetch
clear
cd sources/
cleart
clear
tar -xvf less-679.tar.gz 
cd less-679
clear
./configure --prefix=/usr --sysconfdir=/etc
make -j4
make check
make install
clear
cd ..
rm -Rf less-679
clear
exit
clear
cd sources/
tar -xvf perl-5.42.0.tar.xz 
cd perl-5.42.0
clear
export BUILD_ZLIB=False
export BUILD_BZIP2=0
sh Configure -des                                                       -D prefix=/usr                                             -D vendorprefix=/usr                                       -D privlib=/usr/lib/perl5/5.42/core_perl                   -D archlib=/usr/lib/perl5/5.42/core_perl                   -D sitelib=/usr/lib/perl5/5.42/site_perl                   -D sitearch=/usr/lib/perl5/5.42/site_perl                  -D vendorlib=/usr/lib/perl5/5.42/vendor_perl               -D vendorarch=/usr/lib/perl5/5.42/vendor_perl              -D man1dir=/usr/share/man/man1                             -D man3dir=/usr/share/man/man3                             -D pager="/usr/bin/less -isR"                              -D useshrplib                                              -D usethreads
clear
make -j4
make install
unset BUILD_ZLIB BUILD_BZIP2
clear
cd ..
rm -Rf perl-5.42.0
clear
exit
clear
cd sources/
ls
clear
tar -xvf XML-Parser-2.47.tar.gz 
cd XML-Parser-2.47
clear
perl Makefile.PL
make -j4
make install
clear
cd ..
rm -Rf XML-Parser-2.47
clear
exit
clear
cd sources/
tar -xvf intltool-0.51.0.tar.gz 
cd intltool-0.51.0
clear
sed -i 's:\\\${:\\\$\\{:' intltool-update.in
./configure --prefix=/usr
make -j4
make install
clear
install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO
cd ..
rm -Rf intltool-0.51.0
clear
exit
clear
neofetch
cd sources/
tar -xvf autoconf-2.72.tar.xz 
cd autoconf-2.72
clear
./configure --prefix=/usr
make -j4
make install
cd ..
rm -Rf autoconf-2.72
clear
exit
clear
neofetch
ls
,
exit
clear
cd sources/
clear
tar -xvf automake-1.18.1.tar.xz 
cd automake-1.18.1
clear
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.18.14
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.18.1
clear
make -j4
make install
clear
cd ..
rm -Rf automake-1.18.1
clear
exit
clear
cd sources/
clear
tar -xvf openssl-3.5.2.tar.gz 
cd openssl-3.5.2
clear
./config --prefix=/usr                  --openssldir=/etc/ssl          --libdir=lib                   shared                         zlib-dynamic
clear
make
clear
sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
make MANSUFFIX=ssl install
mv -v /usr/share/doc/openssl /usr/share/doc/openssl-3.5.2
cp -vfr doc/* /usr/share/doc/openssl-3.5.2
clear
cd ..
rm -Rf openssl-3.5.2
clear
exit
clear
cd sources/
clear
ls
clear
tar -xvf elfutils-0.193.tar.bz2 
cd elfutils-0.193
clear
./configure --prefix=/usr                    --disable-debuginfod             --enable-libdebuginfod=dummy
clear
make -j4
clear
neofetch
make -C libelf install
install -vm644 config/libelf.pc /usr/lib/pkgconfig
rm /usr/lib/libelf.a
clear
cd ..
rm -Rf elfutils-0.193
clear
exit
clear
cd sources/
clear
tar -xvf libffi-3.5.2.tar.gz 
cd libffi-3.5.2
clear
./configure --prefix=/usr                --disable-static             --with-gcc-arch=native
clear
make -j4
make install
clear
cd ..
rm -Rf libffi-3.5.2
clear
exit
clear
cd sources/
tar -xvf python-3.13.7-docs-html.tar.bz2 
tar -xvf Python-3.13.7.tar.xz 
rm -Rf python-3.13.7-docs-html
cd Python-3.13.7
clear
./configure --prefix=/usr                      --enable-shared                    --with-system-expat                --enable-optimizations             --without-static-libpython
make -j4
make install
cat > /etc/pip.conf << EOF
[global]
root-user-action = ignore
disable-pip-version-check = true
EOF

clear
install -v -dm755 /usr/share/doc/python-3.13.7/html
tar --strip-components=1      --no-same-owner           --no-same-permissions     -C /usr/share/doc/python-3.13.7/html     -xvf ../python-3.13.7-docs-html.tar.bz2
clear
cd ..
rm -Rf Python-3.13.7
clear
exit
clear
neofetch
cd sources/
tar -xvf flit_core-3.12.0.tar.gz 
cd flit_core-3.12.0
clear
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist flit_core
clear
cd ..
rm -Rf flit_core-3.12.0
clear
exit
clear
cd sources/
tar -xvf packaging-25.0.tar.gz 
cd packaging-25.0
clear
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist packaging
clear
cd ..
rm -Rf packaging-25.0
clear
exit
clear
cd sources/
clear
tar -xvf wheel-0.46.1.tar.gz 
cd wheel-0.46.1
clear
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist wheel
clear
cd ..
rm -Rf wheel-0.46.1
exi
exit
clear
cd sources/
clear
tar -xvf setuptools-80.9.0.tar.gz 
cd setuptools-80.9.0
clear
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist setuptools
cd ..
rm -Rf setuptools-80.9.0
clear
exit
clear
cd sources/
tar -xvf ninja-1.13.1.tar.gz 
cd ninja-1.13.1
clear
export NINJAJOBS=4
sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc
python3 configure.py --bootstrap --verbose
install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja
clear
cd ..
rm -Rf ninja-1.13.1
clear
exit
clear
cd sources/
tar -xvf meson-1.8.3.tar.gz 
cd meson-1.8.3
clear
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist meson
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson
cd ..
rm -Rf meson-1.8.3
clear
exit
clear
cd sources/
clear
tar -xvf kmod-34.2.tar.xz 
cd kmod-34.2
clear
mkdir -p build
cd build
clear
meson setup --prefix=/usr ..                --buildtype=release             -D manpages=false
ninja
ninja install
clear
cd ../..
clear
rm -Rf kmod-34.2
clear
exit
cd sources/
tar -xvf coreutils-9.7
tar -xvf coreutils-9.7.tar.xz 
cd coreutils-9.7
clear
patch -Np1 -i ../coreutils-9.7-upstream_fix-1.patch
patch -Np1 -i ../coreutils-9.7-i18n-1.patch
autoreconf -fv
automake -af
FORCE_UNSAFE_CONFIGURE=1 ./configure             --prefix=/usr                        --enable-no-install-program=kill,uptime
clear
make -j4
make NON_ROOT_USERNAME=tester check-root
groupadd -g 102 dummy -U tester
chown -R tester . 
su tester -c "PATH=$PATH make -k RUN_EXPENSIVE_TESTS=yes check"    < /dev/null
groupdel dummy
clear
make install
mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8
clear
cd ..
rm -Rf coreutils-9.7
clear
exit
clear
cd sources/
clear
tar -xvf diffutils-3.12.tar.xz 
cd diff
cd diffutils-3.12
clear
./configure --prefix=/usr
make -j4
make install
cd ..
rm -Rf diffutils-3.12
clear
exit
clear
cd sources/
tar -xvf gawk-5.3.2.tar.xz 
cd gawk-5.3.2
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr
make -j4
clear
rm -f /usr/bin/gawk-5.3.2
make install
ln -sv gawk.1 /usr/share/man/man1/awk.1
install -vDm644 doc/{awkforai.txt,*.{eps,pdf,jpg}} -t /usr/share/doc/gawk-5.3.2
clear
cd ..
rm -Rf gawk-5.3.2
clear
cd ..
exit
clear
cd souq
cd sources/
clear
tar -xvf findutils-4.10.0.tar.xz 
cd findutils-4.10.0
clear
./configure --prefix=/usr --localstatedir=/var/lib/locate
make -j4
make install
clear
cd ..
rm -Rf findutils-4.10.0
clear
cd ..
exit
clear
cd sources/
clea
clear
tar -xvf groff-1.23.0.tar.gz 
cd groff-1.23.0
clear
PAGE=<paper_size> ./configure --prefix=/usr
make -j4
clear
neofetch 
clear
./configure --prefix=/usr
PAGE=A4 ./configure --prefix=/usr
clear
make -j4
make install
clear
cd ..
rm -Rf groff-1.23.0
clear
exit
