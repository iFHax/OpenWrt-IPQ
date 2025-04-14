include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

define Device/glinet_gl-be3600
	$(call Device/FitImage)
	$(call Device/UbiFit)
	DEVICE_VENDOR := GL.iNet
	DEVICE_MODEL := BE3600
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	DEVICE_DTS_CONFIG := config@cp01
	DEVICE_DTS := ipq5312-glinet-be3600
	DEVICE_PACKAGES := ipq-wifi-gl-be3600 kmod-fs-ext4 e2fsprogs
	SOC := ipq5312
	IMAGE_SIZE := 113664k
	IMAGES := sysupgrade.bin
	IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += glinet_gl-be3600 