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
