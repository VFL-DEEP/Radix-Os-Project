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
