# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

inherit systemd

SERIAL_CONSOLES = "115200;ttyS0"
IMAGE_OVERHEAD_FACTOR = "1.6"
# Include modules in rootfs
IMAGE_INSTALL += " \
	apt \
	busybox \
	cpuburn-neon \
	dhcp-server \
	dhcp-client \
	gcc \
	hostapd \
	i2c-tools \
	init-ifupdown \
	iperf3 \
	iperf2 \
	kernel-modules \
	make \
	minicom \
	raspi-gpio \
	screen \
	stress \
	pigpio \
	python \
	python-modules \
	python3 \
	python3-modules \
	usbutils \
	memtester \
	packagegroup-core-boot \
	packagegroup-core-full-cmdline \
	packagegroup-core-buildessential \
	${CORE_IMAGE_EXTRA_INSTALL} \
	"

SPLASH = "psplash-raspberrypi"

IMAGE_FEATURES += "ssh-server-dropbear splash "

do_image_prepend() {
    bb.warn("The image is'rpi3-image-raspberrypi3.rpi-sdimg' ")
}

 
