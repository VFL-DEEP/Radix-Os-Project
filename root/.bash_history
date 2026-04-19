clear
neofetch 
exit
clear
ls
cd sources/
clear
tar -xvf gzip-1.14.tar.xz 
cd gzip-1.14
clear
./configure --prefix=/usr
clear
make -j4
make check
clear
make install
clear
cd ..
rm -Rf gzip-1.14
exit
clea
clear
cd sources/
clear
tar -xvf iproute2-6.16.0.tar.xz 
cd iproute2-6.16.0
clear
./configure --prefix=/usr
clear
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8
make NETNS_RUN_DIR=/run/netns
clear
make SBINDIR=/usr/sbin install
install -vDm644 COPYING README* -t /usr/share/doc/iproute2-6.16.0
clear
cd ..
rm -Rf iproute2-6.16.0
clear
exit
clear
cd sources/
clear
tar -xvf kbd-2.8.0
tar -xvf kbd-2.8.0.tar.xz 
cd kbd-2.8.0
clear
patch -Np1 -i ../kbd-2.8.0-backspace-1.patch
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
clear
./configure --prefix=/usr --disable-vlock
clear
make -j4
clear
make install
clear
cd ..
rm -Rf kbd-2.8.0
clear
exit
clear
cd sources/
tar -xvf libpipeline-1.5.8.tar.gz 
cd libpipeline-1.5.8
clear
./configure --prefix=/usr
make
make install
cd ..
rm -Rf libpipeline-1.5.8
clear
exit
clear
cd sources/
clear
tar -xvf make-4.4.1.tar.gz 
cd make-4.4.1
clear
./configure --prefix=/usr
make
make install
cd ..
rm -Rf make-4.4.1
clear
exit
cd sources/
tar -xvf patch-2.8.tar.xz 
cd patch-2.8
clear
./configure --prefix=/usr
make -j4
make install
cd ..
rm -Rf patch-2.8
clear
exit
clear
cd sources/
clear
tar -xvf tar-1.35.tar.xz 
clear
FORCE_UNSAFE_CONFIGURE=1  ./configure --prefix=/usr
cd tar-1.35
FORCE_UNSAFE_CONFIGURE=1  ./configure --prefix=/usr
make -j4
clear
make check
clear
make install
clear
cd ..
rm -Rf tar-1.35
clear
exit
