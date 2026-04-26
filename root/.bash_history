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
clear
cd sources/
tar -xvf texinfo-7.2.tar.xz 
cd texinfo-7.2
clear
sed 's/! $output_file eq/$output_file ne/' -i tp/Texinfo/Convert/*.pm
./configure --prefix=/usr
make -j4
make install
cd ..
cd texinfo-7.2
make TEXMF=/usr/share/texmf install-tex
cd ..
rm -Rf texinfo-7.2
clear
exit
clear
cd sources/
tar -xvf vim-9.1.1629.tar.gz 
cd vim-9.1.1629
clear
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr
make -j4
make install
ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do     ln -sv vim.1 $(dirname $L)/vi.1; done
ln -sv ../vim/vim91/doc /usr/share/doc/vim-9.1.1629
cd ..
rm -Rf vim-9.1.1629
clear
exit
clear
cd sources/
tar -xvf markupsafe-3.0.2.tar.gz 
cd markupsafe-3.0.2
clear
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist Markupsafe
cd ..
rm -Rf markupsafe-3.0.2
clear
exit
clear
cd sources/
tar -xvf jinja2-3.1.6.tar.gz 
cd jinja2-3.1.6
clear
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD
pip3 install --no-index --find-links dist Jinja2
cd ..
rm -Rf jinja2-3.1.6
clear
exit
clear
cd sources/
tar -xvf udev-lfs-20230818.tar.xz 
cd udev-lfs-20230818
clear
sed -e 's/GROUP="render"/GROUP="video"/'     -e 's/GROUP="sgx", //'                   -i rules.d/50-udev-default.rules.in
sed -e 's/GROUP="render"/GROUP="video"/'     -e 's/GROUP="sgx", //'                   -i rules.d/50-udev-default.rules.in
cd ..
tar -xvf systemd-257.8.tar.gz 
rm -Rf systemd-
rm -Rf systemd-257.8
clar
umount -v $radixlinux/dev/shm
umount -v $radixlinux/dev/pts
umount -v $radixlinux/dev
umount -v $radixlinux/run
umount -v $radixlinux/proc
umount -v $radixlinux/sys
exit
clear
neofetch
free -h
ls
xd sources/
cd sources/
ls
clear
neofetch
exit
