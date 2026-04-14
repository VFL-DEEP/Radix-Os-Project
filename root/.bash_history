clear
neofetch
nano /etc/os-release 
neofetch
clear
neofetch
ls
nano README.md 
git status
clear
cd sources/
tar -xvf ncurses-6.5-20250809.tgz 
cd ncurses-6.5-20250809
clear
./configure --prefix=/usr                       --mandir=/usr/share/man             --with-shared                       --without-debug                     --without-normal                    --with-cxx-shared                   --enable-pc-files                   --with-pkg-config-libdir=/usr/lib/pkgconfig
make -j4
clear
make DESTDIR=$PWD/dest install
install -vm755 dest/usr/lib/libncursesw.so.6.5 /usr/lib
rm -v  dest/usr/lib/libncursesw.so.6.5
sed -e 's/^#if.*XOPEN.*$/#if 1/'     -i dest/usr/include/curses.h
cp -av dest/* /
for lib in ncurses form panel menu ; do     ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so;     ln -sfv ${lib}w.pc    /usr/lib/pkgconfig/${lib}.pc; done
ln -sfv libncursesw.so /usr/lib/libcurses.so
cp -v -R doc -T /usr/share/doc/ncurses-6.5-20250809
cd ..
rm -Rf ncurses-6.5-20250809
clear
exit
clear
neofetch
cd sources/
tar -xvf sed-4.9.tar.xz 
cd sed-4.9
./configure --prefix=/usr
make
make html
chown -R tester .
su tester -c "PATH=$PATH make check"
make install
install -d -m755           /usr/share/doc/sed-4.9
install -m644 doc/sed.html /usr/share/doc/sed-4.9
cd ..
rm -Rf sed-4.9
exit
clear
cd sources/q
cd sources/
clear
tar -xvf psmisc-23.7.tar.xz 
cd psmisc-23.7
./configure --prefix=/usr
make
make check
make install
cd ..
rm -Rf psmisc-23.7
clear
exit
clear
neofetch
cd sources/
clear
tar -xvf gettext-0.26.tar.xz 
cd gettext-0.26
clear
./configure --prefix=/usr                --disable-static             --docdir=/usr/share/doc/gettext-0.26
make -j4
make check
make install
chmod -v 0755 /usr/lib/preloadable_libintl.so
cd ..
rm -Rf gettext-0.26
clear
exit
clear
cd sources/
tar -xvf bison-3.8.2.tar.xz 
cd bison-3.8.2
clear
./configure --prefix=/usr --docdir=/usr/share/doc/bison-3.8.2
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
