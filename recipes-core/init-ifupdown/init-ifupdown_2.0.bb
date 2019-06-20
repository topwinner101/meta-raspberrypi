SUMMARY = "Basic TCP/IP networking init scripts and configuration files"
DESCRIPTION = "This package provides high level tools to configure network interfaces"
HOMEPAGE = "http://packages.debian.org/ifupdown"
SECTION = "base"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${WORKDIR}/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
PR = "r7"

inherit update-rc.d

INITSCRIPT_NAME = "networking"
INITSCRIPT_PARAMS = "start 01 2 3 4 5 . stop 80 0 6 1 ."

SRC_URI = "file://copyright \
           file://init \
           file://interfaces \
           file://factory_eth0.sh \
           file://factory_facn1_1.sh \
           file://factory_facn1_2.sh \
           file://factory_facn2_1.sh \
           file://factory_facn2_2.sh \
           file://factory_facn_all.sh \
           file://factory_i2cdetect.sh \
           file://factory_pca9548.sh \
           file://factory_psu_a_on.sh \
           file://factory_psu_b_on.sh \
           file://factory_psu_a_off.sh \
           file://factory_psu_b_off.sh \
           file://factory_pwm1_100p.sh \
           file://factory_pwm2_100p.sh \
           file://factory_pwm1_90p.sh \
           file://factory_pwm2_90p.sh \
           file://factory_pwm1_80p.sh \
           file://factory_pwm2_80p.sh \
           file://factory_pwm1_70p.sh \
           file://factory_pwm2_70p.sh \
           file://factory_pwm1_60p.sh \
           file://factory_pwm2_60p.sh \
           file://factory_pwm1_50p.sh \
           file://factory_pwm2_50p.sh \
           file://factory_pwm1_40p.sh \
           file://factory_pwm2_40p.sh \
           file://factory_pwm1_30p.sh \
           file://factory_pwm2_30p.sh \
           file://factory_pwm1_20p.sh \
           file://factory_pwm2_20p.sh \
           file://factory_pwm1_10p.sh \
           file://factory_pwm2_10p.sh \
           file://factory_pwm1_0p.sh \
           file://factory_pwm2_0p.sh \
           file://factory_usb0.sh \
           file://nfsroot"

S = "${WORKDIR}"

do_install () {
	install -d ${D}${sysconfdir}/init.d \
			${D}${sysconfdir}/network/if-pre-up.d \
			${D}${sysconfdir}/network/if-up.d \
			${D}${sysconfdir}/network/if-down.d \
			${D}${sysconfdir}/network/if-post-down.d
	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d

	install -d ${D}${sysconfdir}/factory 
		install -m 0777 ${WORKDIR}/factory_eth0.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_facn1_1.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_facn1_2.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_facn2_1.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_facn2_2.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_facn_all.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_i2cdetect.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pca9548.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_psu_a_on.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_psu_b_on.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_psu_a_off.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_psu_b_off.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_100p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_100p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_90p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_90p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_80p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_80p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_70p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_70p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_60p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_60p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_50p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_50p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_40p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_40p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_30p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_30p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_20p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_20p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_10p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_10p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm1_0p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_pwm2_0p.sh ${D}${sysconfdir}/factory/
		install -m 0777 ${WORKDIR}/factory_usb0.sh ${D}${sysconfdir}/factory/
}

do_install_append_qemuall () {
	# Disable network manager on machines that commonly do NFS booting
	touch ${D}${sysconfdir}/network/nm-disabled-eth0
}

PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
RDEPENDS_${PN} = "netbase"
RCONFLICTS_${PN} = "netbase (< 1:5.0)"

CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
