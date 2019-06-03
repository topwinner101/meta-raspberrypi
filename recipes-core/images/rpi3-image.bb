# Base this image on core-image-minimal
include recipes-core/images/core-image-minimal.bb

inherit systemd

SERIAL_CONSOLES = "115200;ttyS0"

# Include modules in rootfs
IMAGE_INSTALL += " \
	kernel-modules \
	busybox \
	raspi-gpio \
	i2c-tools \
	iperf3 \
	"

SPLASH = "psplash-raspberrypi"

IMAGE_FEATURES += "ssh-server-dropbear splash   "

do_image_prepend() {
    bb.warn("The image 'rpi3-image' is deprecated ")
}
