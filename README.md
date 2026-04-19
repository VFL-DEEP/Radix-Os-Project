<p align="center"><img src="/img/newlogo.jpg" alt="radix os logo" width="150"></p>

<h1 align="center">Radix Linux 0.9 Beta Version</h1>

<p align="center">Radix Linux is a lightweight Linux distribution currently in beta, designed specifically for students.
 It is built from scratch to run efficiently on low-resource hardware and offers Turkish language support. 
 This early version invites testing and feedback from its users.
 https://www.reddit.com/r/RadixLinuxCommunity/</p>

<hr>

## How to install Radix Linux on your Virtual Environment?


1. Before installing the os onto your machine, you need to have a empty partition. It needs to have at least 25 GB storage. When you make sure you have, you can go on with the installation process.

   - **At first, you need  a mounting point on your hostsytem. You can copy the os files to mountponit with this command**:
     ```
     cp Radix-Os-Project /mnt/radixlinux
     ```

2. After creating the mount directory, you need to create a varibale to simplify the installation guide.
   - **You can create the variable with this command**:
     ```
     export radixlinux=/mnt/radixlinux
     ```

3. After creating the variable, you need to set umask in case your distro uses a different one.
   - **You can set umask with this command**:
     ```
     umask 022
     ```


#Note: After each time you close or open a new terminal, you might need to set the umask and variable again. For making sure it is set correctly use this command:
   - **You can set check the variable and umask with this command**:
     ```
     echo $radixlinux
     umask
     ```

4. After checking the variable, you now need to mount your disk into the mountpoint.
   - **Use this command to make your variable a mountpoint**:
     ```
     mkdir -pv $radixlinux
     ```	
   - **After creating the mountpoint, use this command to mount your disk**:
     ```
     mount -v -t ext4 /dev/sda(yourdisknumber) $radixlinux
     ``` 

5. After that, you need to be root user to continue. When you become root user, first check the variable and umask again, then make sure that you changed the ownership of Radix Linux folder to root user.
 - **You can be root user and change the ownership with this commands**:
     ```
     sudo su
     chown -R root:root $radixlinux
     ```
- **Now change into the directory with this command**:
     ```
     cd $radixlinux
     ```

 6. After that, you need to mount your host systems kernel drivers because we dont have any yet:)
 - **Now mount some directories with this command**:
     ```
     mount -v -t sysfs sysfs $radixlinux/sys
     mount -v -t proc proc $radixlinux/proc
     mount -v -t tmpfs tmpfs $radixlinux/run
     mount -v --bind /dev $radixlinux/dev
     mount -v --bind /dev/pts $radixlinux/dev/pts
     mount -v -t tmpfs tmpfs $radixlinux/dev/shm

     ```
 7. After you finished testing, you need to unmount them so come back here later and skip this part for now :)
- **You can unmount the mounted directories with this command**:
     ```
     umount -v $radixlinux/dev/shm
     umount -v $radixlinux/dev/pts
     umount -v $radixlinux/dev
     umount -v $radixlinux/run
     umount -v $radixlinux/proc
     umount -v $radixlinux/sys
     ```


Enter the Chroot Virtual Environment and do everything!

1. If you arrived here, you are an Linux expert or a tester so you can have fun using our system or compiling every single thing you want :) So we are gonna give you a fresh chroot environment then you have the freedom to compile any package you want among all 94 packages in sources folder. 
NOTE:(Once you finished using, go back to the 7th part and unmount before leaving!)

- **Enter the chroot environment with these commands**:
     ```
     chroot "$radixlinux" /usr/bin/env -i   \
         HOME=/root                  \
         TERM="$TERM"                \
         PS1='(radix linux chroot) \u:\w\$ ' \
         PATH=/usr/bin:/usr/sbin     \
         MAKEFLAGS="-j$(nproc)"      \
         TESTSUITEFLAGS="-j$(nproc)" \
         /bin/bash --login

     exec /usr/bin/bash --login
     ```


## REAL TESTING ON YOUR OWN MACHİNE (NOT RECOMMENDED!)


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
     make modules_install INSTALL_MOD_PATH=$radixlinux 
     ```
- **Now, we need to make a few changes**:
     ```
     cp -iv arch/x86/boot/bzImage \
     $radixlinux/boot/vmlinuz-6.16.1-radix
     
     cp -iv System.map \
     $radixlinux/boot/System.map-6.16.1

     cp -iv .config 
     $radixlinux/boot/config-6.16.1

     cp -r Documentation -T 
     $radixlinux/usr/share/doc/linux-6.16.1
     ```
  Now you are ready to boot into your os :)

   
     

## Thank you for testing our software and sharing your ideas. See you later.

