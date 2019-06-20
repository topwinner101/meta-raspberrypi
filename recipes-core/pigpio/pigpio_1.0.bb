SUMMARY = "pi gpio"
DESCRIPTION = "pi gpio."
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=1f4918231bf4ab776344eb99fe22b87d"

SRC_URI = "file://pigpio-master.tar \
           file://tar_pigpio.sh \
           file://pigpio.tar1 \
           file://install_pigpio.sh \
           file://README"

S = "${WORKDIR}"
TARGET_CC_ARCH += "${LDFLAGS}"


do_install () {
	install -d                             ${D}/etc
	install -m 0777 pigpio.tar1            ${D}/etc
	install -m 0777 install_pigpio.sh      ${D}/etc
}
