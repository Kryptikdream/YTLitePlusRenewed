ifeq ($(ROOTLESS),1)
THEOS_PACKAGE_SCHEME=rootless
else ifeq ($(ROOTHIDE),1)
THEOS_PACKAGE_SCHEME=roothide
endif

DEBUG=0
FINALPACKAGE=1
ARCHS = arm64
PACKAGE_VERSION = 3.0.1
TARGET := iphone:clang:16.5:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VideoOverlayTweaks
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation SystemConfiguration AVFoundation Photos
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-unused-function -DTWEAK_VERSION=$(PACKAGE_VERSION) "-I." "-I./Files" "-I../YouTubeHeader" "-I../"
$(TWEAK_NAME)_FILES = $(wildcard *.x Utils/*.m)
$(TWEAK_NAME)_LDFLAGS = -weak_framework AVFoundation -weak_framework Photos

include $(THEOS_MAKE_PATH)/tweak.mk
