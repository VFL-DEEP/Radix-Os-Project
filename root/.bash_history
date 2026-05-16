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
clear
neofetch 
clear
useradd -m <tester>
useradd -m tester
clear
cat > /etc/profile << "EOF"
# Begin /etc/profile
# Written for Beyond Linux From Scratch
# by James Robertson <jameswrobertson@earthlink.net>
# modifications by Dagmar d'Surreal <rivyqntzne@pbzpnfg.arg>

# System wide environment variables and startup programs.

# System wide aliases and functions should go in /etc/bashrc.  Personal
# environment variables and startup programs should go into
# ~/.bash_profile.  Personal aliases and functions should go into
# ~/.bashrc.

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)
pathremove () {
        local IFS=':'
        local NEWPATH
        local DIR
        local PATHVARIABLE=${2:-PATH}
        for DIR in ${!PATHVARIABLE} ; do
                if [ "$DIR" != "$1" ] ; then
                  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
                fi
        done
        export $PATHVARIABLE="$NEWPATH"
}

pathprepend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

pathappend () {
        pathremove $1 $2
        local PATHVARIABLE=${2:-PATH}
        export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

export -f pathremove pathprepend pathappend

# Set the initial path
export PATH=/usr/bin

# Attempt to provide backward compatibility with LFS earlier than 11
if [ ! -L /bin ]; then
        pathappend /bin
fi

if [ $EUID -eq 0 ] ; then
        pathappend /usr/sbin
        if [ ! -L /sbin ]; then
                pathappend /sbin
        fi
        unset HISTFILE
fi

# Set up some environment variables.
export HISTSIZE=1000
export HISTIGNORE="&:[bf]g:exit"

# Set some defaults for graphical systems
export XDG_DATA_DIRS=${XDG_DATA_DIRS:-/usr/share}
export XDG_CONFIG_DIRS=${XDG_CONFIG_DIRS:-/etc/xdg}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/tmp/xdg-$USER}

for script in /etc/profile.d/*.sh ; do
        if [ -r $script ] ; then
                . $script
        fi
done

unset script

# End /etc/profile
EOF

clear
install --directory --mode=0755 --owner=root --group=root /etc/profile.d
clear
" Begin .vimrc

set columns=80
set wrapmargin=8
set ruler

" End .vimrc
clear
make install-random
clear
cd sources/
tar -xvf make-ca-1.16.1.tar.gz 
cd make-ca-1.16.1
clear
/usr/sbin/make-ca -g
cat > /etc/cron.weekly/update-pki.sh << "EOF" &&
#!/bin/bash
/usr/sbin/make-ca -g
EOF
 chmod 754 /etc/cron.weekly/update-pki.sh
cd ..
tar -xvf p11-kit-0.25.5.tar.xz 
cd  p11-kit-0.25.5
sed '20,$ d' -i trust/trust-extract-compat &&
cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

mkdir p11-build && cd    p11-build && meson setup ..                  --prefix=/usr             --buildtype=release       -D trust_paths=/etc/pki/anchors && ninja
clear
wget http://www.cacert.org/certs/root.crt && wget http://www.cacert.org/certs/class3.crt && openssl x509 -in root.crt -text -fingerprint -setalias "CAcert Class 1 root"         -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning         > /etc/ssl/local/CAcert_Class_1_root.pem && openssl x509 -in class3.crt -text -fingerprint -setalias "CAcert Class 3 root"         -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning         > /etc/ssl/local/CAcert_Class_3_root.pem && /usr/sbin/make-ca -r
clear
export _PIP_STANDALONE_CERT=/etc/pki/tls/certs/ca-bundle.crt
mkdir -pv /etc/profile.d &&
cat > /etc/profile.d/pythoncerts.sh << "EOF"
# Begin /etc/profile.d/pythoncerts.sh

export _PIP_STANDALONE_CERT=/etc/pki/tls/certs/ca-bundle.crt

# End /etc/profile.d/pythoncerts.sh
EOF

sed '20,$ d' -i trust/trust-extract-compat &&
cat >> trust/trust-extract-compat << "EOF"
# Copy existing anchor modifications to /etc/ssl/local
/usr/libexec/make-ca/copy-trust-modifications

# Update trust stores
/usr/sbin/make-ca -r
EOF

cd ..
cd ..
tar -xvf libtasn1-4.20.0.tar.gz 
cd libtasn1-4.20.0
clear
./configure --prefix=/usr --disable-static && make
make install
make -C doc/reference install-data-local
clear
cd ..
rm -Rf libtasn1-4.20.0
clear
cd p11-kit-0.25.5
cd p11-build/
clear
meson setup ..                  --prefix=/usr             --buildtype=release       -D trust_paths=/etc/pki/anchors && ninja
clear
ninja install && ln -sfv /usr/libexec/p11-kit/trust-extract-compat         /usr/bin/update-ca-certificates
ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
clear
cd ..
rm -Rf p11-build/
cd ..
rm -Rf p11-kit-0.25.5
clear
cd make-ca-1.16.1
clear
make install && install -vdm755 /etc/ssl/local
/usr/sbin/make-ca -g
cat > /etc/cron.weekly/update-pki.sh << "EOF" &&
#!/bin/bash
/usr/sbin/make-ca -g
EOF
 chmod 754 /etc/cron.weekly/update-pki.sh
clear
export _PIP_STANDALONE_CERT=/etc/pki/tls/certs/ca-bundle.crt
mkdir -pv /etc/profile.d &&
cat > /etc/profile.d/pythoncerts.sh << "EOF"
# Begin /etc/profile.d/pythoncerts.sh

export _PIP_STANDALONE_CERT=/etc/pki/tls/certs/ca-bundle.crt

# End /etc/profile.d/pythoncerts.sh
EOF

clear
cd ..
rm -Rf make-ca-1.16.1
clear
exit
