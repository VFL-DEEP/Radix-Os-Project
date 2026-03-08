<p align="center"><img src="/img/smalllogo.png" alt="validebagos logo" width="150"></p>

<h1 align="center">Validebag Os 0.6 Beta Version</h1>

<p align="center">Validebag-OS is a lightweight Linux distribution currently in beta, designed specifically for students.
 It is built from scratch to run efficiently on low-resource hardware and offers Turkish language support. 
 This early version invites testing and feedback from its users.
 https://www.reddit.com/r/ValidebagOsCommunity/</p>

<hr>

## How to install Validebag-Os on your VM?


1. Before installing the os onto your machine, you need to have a empty partition. It needs to have at least 25 GB storage. When you make sure you have, you can go on with the installation process.

   - **At first, you need  a mounting point on your hostsytem. You can copy the os files to mountponit with this command**:
     ```
     cp Validebag-Os-Project /mnt/validebagos
     ```

2. After creating the mount directory, you need to create a varibale to simplify the installation guide.
   - **You can create the variable with this command**:
     ```
     export validebagos=/mnt/validebagos
     ```

3. After creating the variable, you need to set umask in case your distro uses a different one.
   - **You can set umask with this command**:
     ```
     umask 022
     ```


#Note: After each time you close or open a new terminal, you might need to set the umask and variable again. For making sure it is set correctly use this command:
   - **You can set check the variable and umask with this command**:
     ```
     echo $validebagos
     umask
     ```

4. After checking the variable, you now need to mount your disk into the mountpoint.
   - **Use this command to make your variable a mountpoint**:
     ```
     mkdir -pv $validebagos
     ```	
   - **After creating the mountpoint, use this command to mount your disk**:
     ```
     mount -v -t ext4 /dev/sda(yourdisknumber) $validebagos
     ``` 

5. After that, you need to be root user to continue. When you become root user, first check the variable and umask again, then make sure that you changed the ownership of validebag os folder to root user.
 - **You can be root user and change the ownership with this commands**:
     ```
     sudo su
     chown -R root:root $validebagos
     case $(uname -m) in
     x86_64) chown -R root:root $validebagos/lib64 ;;
     esac
     ```
- **Now change into the directory with this command**:
     ```
     cd $validebagos
     ```

6. After that, now we need to create some directories to continue. Do not skip without creating this folders or your installation will fail. 
- **Create those directories with this commands**:
     ```
     mkdir -pv $validebagos/{etc,var} $validebagos/usr/{bin,lib,sbin}

     for i in bin lib sbin; do
       ln -sv usr/$i $validebagos/$i
     done

     case $(uname -m) in
       x86_64) mkdir -pv $validebagos/lib64 ;;
     esac
     ```

7. After that, now we need to create some directories to continue. In this step we are copying additional files into our os files to continue.Do not skip without creating this folders or your installation will fail. 
- **Now create the temporary directories with this commands**:
     ```
     mkdir -pv $validebagos/{dev,proc,sys,run}
     mount -v --bind /dev $validebagos/dev

     mount -vt devpts devpts -o gid=5,mode=0620 $validebagos/dev/pts
     mount -vt proc proc $validebagos/proc
     mount -vt sysfs sysfs $validebagos/sys
     mount -vt tmpfs tmpfs $validebagos/run

     if [ -h $validebagos/dev/shm ]; then
       install -v -d -m 1777 $validebagos$(realpath /dev/shm)
     else
       mount -vt tmpfs -o nosuid,nodev tmpfs $validebagos/dev/shm
     fi
     ```

8. Now,we need to create a few more directories to continue.This directories are specificly for user tasks such as home, local and many other directories. Also do not skip without creating this folders or your installation might fail. 
- **Now change into the directory with this command**:
     ```
     mkdir -pv $validebagos/etc/{opt,sysconfig}
     mkdir -pv $validebagos/lib/firmware
     mkdir -pv $validebagos/media/{floppy,cdrom}
     mkdir -pv $validebagos/usr/{,local/}{include,src}
     mkdir -pv $validebagos/usr/lib/locale
     mkdir -pv $validebagos/usr/local/{bin,lib,sbin}
     mkdir -pv $validebagos/usr/{,local/}share/{color,dict,doc,info,locale,man}
     mkdir -pv $validebagos/usr/{,local/}share/{misc,terminfo,zoneinfo}
     mkdir -pv $validebagos/usr/{,local/}share/man/man{1..8}
     mkdir -pv $validebagos/var/{cache,local,log,mail,opt,spool}
     mkdir -pv $validebagos/var/lib/{color,misc,locate}

     ln -sfv /run /var/run
     ln -sfv /run/lock /var/lock

     install -dv -m 0750 $validebagos/root
     install -dv -m 1777 $validebagos/tmp /var/tmp
     ```

9. After that step, now we need to create some symlinks for being able to go into chroot environment. Also do not skip without creating this symlinks or your installation might fail. 
- **Now create your symlinks with this commands**:
     ```
     ln -sv /proc/self/mounts $validebagos/etc/mtab 

     cat > $validebagos/etc/hosts << EOF
     127.0.0.1  localhost $(hostname)
     ::1        localhost
     EOF

     cat > $validebagos/etc/passwd << "EOF"
     root:x:0:0:root:/root:/bin/bash
     bin:x:1:1:bin:/dev/null:/usr/bin/false
     daemon:x:6:6:Daemon User:/dev/null:/usr/bin/false
     messagebus:x:18:18:D-Bus Message Daemon User:/run/dbus:/usr/bin/false
     uuidd:x:80:80:UUID Generation Daemon User:/dev/null:/usr/bin/false
     nobody:x:65534:65534:Unprivileged User:/dev/null:/usr/bin/false
     EOF

     cat > $validebagos/etc/group << "EOF"
     root:x:0:
     bin:x:1:daemon
     sys:x:2:
     kmem:x:3:
     tape:x:4:
     tty:x:5:
     daemon:x:6:
     floppy:x:7:
     disk:x:8:
     lp:x:9:
     dialout:x:10:
     audio:x:11:
     video:x:12:
     utmp:x:13:
     cdrom:x:15:
     adm:x:16:
     messagebus:x:18:
     input:x:24:
     mail:x:34:
     kvm:x:61:
     uuidd:x:80:
     wheel:x:97:
     users:x:999:
     nogroup:x:65534:
     EOF



     touch $validebagos/var/log/{btmp,lastlog,faillog,wtmp}
     chgrp -v utmp $validebagos/var/log/lastlog
     chmod -v 664  $validebagos/var/log/lastlog
     chmod -v 600  $validebagos/var/log/btmp
     ```

Enter the Chroot environment and compile everything!

1. If you arrived here, you are an Linux expert and you wanna have fun compiling every single thing you want :) So we are gonna give you a fresh chroot environment then you have the freedom to compile any package you want among all 94 packages in sources folder. After you think you compiled enough, the kernel compilation steps are same with the First way. Have fun :)

- **Enter the chroot environment with these commands**:
     ```
     chroot "$validebagos" /usr/bin/env -i   \
         HOME=/root                  \
         TERM="$TERM"                \
         PS1='(validebagos chroot) \u:\w\$ ' \
         PATH=/usr/bin:/usr/sbin     \
         MAKEFLAGS="-j$(nproc)"      \
         TESTSUITEFLAGS="-j$(nproc)" \
         /bin/bash --login

     exec /usr/bin/bash --login
     ```
2. If you want to boot it on your computer and wanna try real linux experince. After all 94 packages in sources folder, You can now compile your kernel and boot in your system with this steps:
- **Make your system ready for compilation**:

- **Now, lets start to compile your kernel with mrproper**:
   ```
     make mrproper
     ```

- **Now, get the default configs for your kernel**:
     ```
     make defconfig
     ```
- **Now, compile your kernel**:
     ```
     make 
     ```
- **After compiling, its time to install your kernel**:
     ```
     make modules_install INSTALL_MOD_PATH=$validebagos 
     ```
- **Now, we need to make a few changes**:
     ```
     cp -iv arch/x86/boot/bzImage \
     $validebagos/boot/vmlinuz-6.16.1-validebag
     
     cp -iv System.map \
     $validebagos/boot/System.map-6.16.1

     cp -iv .config 
     $validebagos/boot/config-6.16.1

     cp -r Documentation -T 
     $validebagos/usr/share/doc/linux-6.16.1
     ```
  Now you are ready to boot into your os :)

   
     

## Thank you for testing our software and sharing your ideas. See you later.

