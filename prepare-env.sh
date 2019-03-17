#!/bin/sh
[! -d "./dl" ] && {
	mkdir dl
}

[ ! -f "./dl/arm-trusted-firmware.tar.gz" ] && {
	echo  "\033[32mDownload arm-trusted-firmware\n\033[0m"
	wget -O dl/arm-trusted-firmware.tar.gz https://github.com/ARM-software/arm-trusted-firmware/archive/v2.0.tar.gz	
	tar zxf dl/arm-trusted-firmware.tar.gz && {
		mv arm-trusted-firmware-* arm-trusted-firmware
	}
}

[ ! -f "./dl/u-boot.tar.gz" ] && {
	echo  "\033[32mDownload u-boot \n\033[0m"
	wget -O dl/u-boot.tar.gz https://github.com/u-boot/u-boot/archive/v2018.11.tar.gz
	tar zxf dl/u-boot.tar.gz && {
		mv u-boot-* u-boot
	}
}

[ ! -f "./dl/optee_os.tar.gz" ] && {
	echo  "\033[32mDownload optee_os \n\033[0m"
	wget -O dl/optee_os.tar.gz https://github.com/OP-TEE/optee_os/archive/3.4.0.tar.gz
	tar zxf dl/optee_os.tar.gz && {
		mv optee_os-* optee_os
	}
	sed -i /ta_arm32/d optee_os/core/arch/arm/plat-rpi3/conf.mk
}

[ ! -f "./dl/optee_client.tar.gz" ] && {
	echo  "\033[32mDownload optee_client \n\033[0m"
	wget -O dl/optee_client.tar.gz https://github.com/OP-TEE/optee_client/archive/3.3.0.tar.gz
	tar zxf dl/optee_client.tar.gz && {
		mv optee_client-* optee_client
	}
}

[ ! -f "./dl/optee_examples.tar.gz" ] && {
	echo  "\033[32mDownload optee_examples \n\033[0m"
	wget -O dl/optee_examples.tar.gz https://github.com/linaro-swg/optee_examples/archive/3.3.0.tar.gz
	tar zxf dl/optee_examples.tar.gz && {
		mv optee_examples-* optee_examples
	}
}
[ ! -f "./dl/linux.tar.gz" ] && {
	echo  "\033[32mDownload linux\n\033[0m"
	wget -O dl/linux.tar.gz https://github.com/raspberrypi/linux/archive/raspberrypi-kernel_1.20190215-1.tar.gz
	tar zxf dl/linux.tar.gz && {
		mv linux-* linux
	}
}

