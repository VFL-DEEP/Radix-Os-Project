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
clear
cd sources/
clear
tar -xvf grub-2.12.tar.xz 
cd grub-2.12
clear
mkdir -pv /usr/share/fonts/unifont && gunzip -c ../unifont-16.0.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
cd ..
clear
tar -xvf freetype-2.13.3.tar.xz 
cd freetype-2.13.3
clear
tar -xf ../freetype-doc-2.13.3.tar.xz --strip-components=2 -C docs
sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg && sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:"     -i include/freetype/config/ftoption.h  && ./configure --prefix=/usr --enable-freetype-config --disable-static && make
clear
make install
cp -v -R docs -T /usr/share/doc/freetype-2.13.3 && rm -v /usr/share/doc/freetype-2.13.3/freetype-config.1
clear
cd ..
rm -Rf freetype-2.13.3
clear
cd grub-2.12
mkdir -pv /usr/share/fonts/unifont && gunzip -c ../unifont-16.0.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
unset {C,CPP,CXX,LD}FLAGS
clear
echo depends bli part_gpt > grub-core/extra_deps.lst
clear
./configure --prefix=/usr                    --sysconfdir=/etc                --disable-efiemu                 --with-platform=efi              --target=x86_64                  --disable-werror     &&
clear
./configure --prefix=/usr                    --sysconfdir=/etc                --disable-efiemu                 --with-platform=efi              --target=x86_64                  --disable-werror     &&
./configure --prefix=/usr                    --sysconfdir=/etc                --disable-efiemu                 --with-platform=efi              --target=x86_64                  --disable-werror    
clear
make -j4
cd ..
tar -xvf efibootmgr-18.tar.gz 
cd efibootmgr-18
clear
cd ..
tar -xvf efivar-39.tar.gz 
cd efivar-39
make ENABLE_DOCS=0
make install ENABLE_DOCS=0 LIBDIR=/usr/lib
install -vm644 docs/efivar.1 /usr/share/man/man1 && install -vm644 docs/*.3      /usr/share/man/man3
cd ..
rm -Rf efivar-39
clear
tar -xvf popt-1.19.tar.gz 
cd popt-1.19
clear
./configure --prefix=/usr --disable-static && make
make install
clear
install -v -m755 -d /usr/share/doc/popt-1.19 && install -v -m644 doxygen/html/* /usr/share/doc/popt-1.19
cd ..
rm -Rf popt-1.19
clear
cd efibootmgr-18
make EFIDIR=LFS EFI_LOADER=grubx64.efi
make install EFIDIR=LFS
cd ..
rm -Rf efibootmgr-18
clear
cd grub-2.12
mkdir -pv /usr/share/fonts/unifont && gunzip -c ../unifont-16.0.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
unset {C,CPP,CXX,LD}FLAGS
make clear
clear
echo depends bli part_gpt > grub-core/extra_deps.lst
./configure --prefix=/usr                    --sysconfdir=/etc                --disable-efiemu                 --with-platform=efi              --target=x86_64                  --disable-werror
clesr
clear
make -j4
clear
ls -l /usr/share/fonts/unifont/unifont.pcf
make -j4
clear
cd ..
tar -xvf unifont-17.0.04.pcf.gz 
gunzip unifont-17.0.04.pcf.gz 
mkdir -v -p /usr/share/fonts/unifont
mv -v unifont-17.0.04.pcf /usr/share/fonts/unifont/unifont.pcf
cd /sources/grub-2.12
make
make install
clear
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
clear
install -vm755 grub-mkfont /usr/bin/ && install -vm644 ascii.h widthspec.h *.pf2 /usr/share/grub/
clear
install -vm755 grub-mount /usr/bin/
cd ..
tar -xvf fuse-3.17.4.tar.gz 
cd fuse-3.17.4
clear
ls
sed -i '/^udev/,$ s/^/#/' util/meson.build && mkdir build && cd    build && meson setup --prefix=/usr --buildtype=release .. && ninja
pushd
pushd ..
popd
clear
ninja install                  && chmod u+s /usr/bin/fusermount3 && cd ..                          && cp -Rv doc/html -T /usr/share/doc/fuse-3.17.4 && install -v -m644   doc/{README.NFS,kernel.txt}                    /usr/share/doc/fuse-3.17.4
clear
cd ..
rm -Rf fuse-3.17.4
clear
tar -xvf LVM2.2.03.34.tgz 
cd LVM2.2.03.34
clear
cd ..
tar -xvf libaio-0.3.113.tar.gz 
cd libaio-0.3.113
clear
sed -i '/install.*libaio.a/s/^/#/' src/Makefile
case "$(uname -m)" in   i?86) sed -e "s/off_t/off64_t/" -i harness/cases/23.t ;; esac
make -j4
make install
cd ..
rm -Rf libaio-0.3.113
clear
cd LVM2.2.03.34
clear
PATH+=:/usr/sbin                ./configure --prefix=/usr                   --enable-cmdlib                 --enable-pkgconfig              --enable-udev_sync  && make
clear
make -C tools install_tools_dynamic && make -C udev  install               && make -C libdm install
make install
make -j4
clear
PATH+=:/usr/sbin ./configure --prefix=/usr --enable-cmdlib --enable-pkgconfig --enable-udev_sync
clear
make -j4
clear
PATH+=:/usr/sbin ./configure --prefix=/usr --enable-cmdlib --enable-pkgconfig --enable-udev_sync
export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:$PKG_CONFIG_PATH
clear
PATH+=:/usr/sbin ./configure --prefix=/usr --enable-cmdlib --enable-pkgconfig --enable-udev_sync
clear
cd ..
tar -xvf eudev-3.2.14.tar.gz 
cd eudev-3.2.14
clear
ls
./configure --prefix=/usr                       --bindir=/usr/bin                   --sysconfdir=/etc                   --libdir=/usr/lib                   --with-rootprefix=                  --with-rootlibdir=/usr/lib             --enable-manpages                   --disable-static
clear
make -j4
make install
clear
ls -l /usr/lib/pkgconfig/libudev.pc
cd /sources/LVM2.2.03.34
export PKG_CONFIG_PATH=/usr/lib/pkgconfig
PATH+=:/usr/sbin ./configure --prefix=/usr --enable-cmdlib --enable-pkgconfig --enable-udev_sync
make -j4
clear
make -C tools install_tools_dynamic && make -C udev  install               && make -C libdm install
clear
LC_ALL=en_US.UTF-8 make check_local
clear
cd ..
tar -xvf which-2.16.tar.gz 
cd which-2.16
clear
./configure --prefix=/usr && make && make install
clear
cd ..
rm -Rf which-2.16
clear
tar -xvf which-2.21.tar.gz 
cd which-2.21
clear
./configure --prefix=/usr && make && make install
clear
cd ..
rm -Rf which-2.16.tar.gz 
rm -Rf which-2.21
clear
cd LVM2.2.03.34
clear
PATH+=:/usr/sbin                ./configure --prefix=/usr                   --enable-cmdlib                 --enable-pkgconfig              --enable-udev_sync  && make
make -C tools install_tools_dynamic && make -C udev  install               && make -C libdm install
clear
   --with-thin-check=         --with-thin-dump=          --with-thin-repair=        --with-thin-restore=       --with-cache-check=        --with-cache-dump=         --with-cache-repair=       --with-cache-restore= \
clear
make install
clear
rm -fv /usr/lib/udev/rules.d/69-dm-lvm.rules
cd ..
rm -Rf LVM2.2.03.34
clear
cd grub-2.12
clear
mkdir -pv /usr/share/fonts/unifont && gunzip -c ../unifont-16.0.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
clear
unset {C,CPP,CXX,LD}FLAGS
echo depends bli part_gpt > grub-core/extra_deps.lst
clear
./configure --prefix=/usr                    --sysconfdir=/etc                --disable-efiemu                 --with-platform=efi              --target=x86_64                  --disable-werror
clea
clear
make -j4
clear
file /usr/share/fonts/unifont/unifont.pcf
rm -v /usr/share/fonts/unifont/unifont.pcf
clear
cd /sources
# Eğer elinde .pcf.gz varsa:
gunzip -c unifont-17.0.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
gunzip -c unifont-17.0.04.pcf.gz > /usr/share/fonts/unifont/unifont.pcf
ls -lh /usr/share/fonts/unifont/unifont.pcf
file /usr/share/fonts/unifont/unifont.pcf
clear
cd /sources/grub-2.12
make
clear
make install && mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
clear
install -vm755 grub-mkfont /usr/bin/ && install -vm644 ascii.h widthspec.h *.pf2 /usr/share/grub/
install -vm755 grub-mount /usr/bin/
clear
ls -R /boot/efi
cd ..
rm -Rf grub-2.12
clear
exit
