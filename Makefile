# export THEOS_DEVICE_IP = 192.168.31.11
export THEOS_DEVICE_IP = 192.168.31.120
export THEOS_DEVICE_PORT = 2222
export TARGET = iphone:clang:latest:15.0

THEOS_PACKAGE_SCHEME=rootless

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ZhihuNoAds

ZhihuNoAds_FILES = Tweak.x
ZhihuNoAds_CFLAGS = -fobjc-arc

ARCHS =arm64 arm64e

include $(THEOS_MAKE_PATH)/tweak.mk
