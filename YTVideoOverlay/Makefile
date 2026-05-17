TARGET := iphone:clang:16.5:14.0
ARCHS = arm64
DEBUG = 0
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = YTVideoOverlay
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation SystemConfiguration AVFoundation Photos
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-unused-function "-I." "-I../YouTubeHeader" "-I../"
$(TWEAK_NAME)_FILES = Init.x Download.x
$(TWEAK_NAME)_LDFLAGS = -weak_framework Photos -weak_framework AVFoundation

include $(THEOS_MAKE_PATH)/tweak.mk
