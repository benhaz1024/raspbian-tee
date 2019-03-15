Raspbian with OP-TEE Support
============================

Introduction
------------

This project discribed how to integrating OP-TEE within Raspbian.

There are two prerequisite:

- Raspbian have 32-bit version only.
- ATF(Trust Firmware-A) now only have 64-bit support for Raspberry Pi 3. (`ATF RPI3 support`_).

I don't want to change this default when considering big workload.
So, this project will build ATF as 64-bit, and all others as 32-bit.

Dependence
----------

- Host OS: Ubuntu 16.04 or later.
- cross build toolchain: aarch64 & aarch32 both needed, and aarch32 must > 6.0. (you can get one, from linaro)

Build
-----
first, config your cross build toolchain at config.mk.

then:
	$ ./prepare-env.sh #if your had download all package, skip this.

	$ ./mkout.sh #create output directory tree.

	$ make patch #this will patch linux kernel & ATF, if you have done before, skip this.

	$ make

Install
-------

Prepare a SD Card Flashed with an official Raspbian image, mount it in linux, such as /media/usr/boot & /meddia/user/rootfs.

Then:
	$cp ./out/boot/* /media/user/boot

	$cp ./out/rootfs/* /media/user/rootfs

Test OP-TEE is ok
-----------------

Boot Rsapberry Pi with the Modified image in SD Card.

When you are logined,then:

	$ ls /dev/tee*
If find "/dev/tee0" and "/dev/teepriv0", then all is OK.

TODO
----

Shell scripts should be moved to Makefile.

.. _ATF RPI3 support: https://github.com/ARM-software/arm-trusted-firmware/blob/620d9832f96ffcaf86d38b703ca913438d6eea7c/plat/rpi3/platform.mk#L164

