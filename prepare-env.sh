#!/bin/sh
[ ! -d "./arm-trusted-firmware" ] && {
	echo  "\033[32mDownload arm-trusted-firmware\n\033[0m"
	wget -O arm-trusted-firmware.tar.gz https://github.com/ARM-software/arm-trusted-firmware/archive/v2.0.tar.gz
	tar zxf arm-trusted-firmware.tar.gz && {
		mv arm-trusted-firmware-* arm-trusted-firmware
		rm arm-trusted-firmware.tar.gz
	}
}

[ ! -d "./u-boot" ] && {
	echo  "\033[32mDownload u-boot \n\033[0m"
	wget -O u-boot.tar.gz https://github.com/u-boot/u-boot/archive/v2018.11.tar.gz
	tar zxf u-boot.tar.gz && {
		mv u-boot-* u-boot
		rm u-boot.tar.gz
	}
}

[ ! -d "./optee_os" ] && {
	echo  "\033[32mDownload optee_os \n\033[0m"
	wget -O optee_os.tar.gz https://github.com/OP-TEE/optee_os/archive/3.4.0.tar.gz
	tar zxf optee_os.tar.gz && {
		mv optee_os-* optee_os
		rm optee_os.tar.gz
	}
	sed -i /ta_arm32/d optee_os/core/arch/arm/plat-rpi3/conf.mk
}

[ ! -d "./optee_client" ] && {
	echo  "\033[32mDownload optee_client \n\033[0m"
	wget -O optee_client.tar.gz https://github.com/OP-TEE/optee_client/archive/3.3.0.tar.gz
	tar zxf optee_client.tar.gz && {
		mv optee_client-* optee_client
		rm optee_client.tar.gz
	}
}

[ ! -d "./linux" ] && {
	echo  "\033[32mDownload linux\n\033[0m"
	wget -O linux.tar.gz https://github.com/raspberrypi/linux/archive/raspberrypi-kernel_1.20190215-1.tar.gz
	tar zxf linux.tar.gz && {
		mv linux-* linux
		rm linux.tar.gz
	}
}

