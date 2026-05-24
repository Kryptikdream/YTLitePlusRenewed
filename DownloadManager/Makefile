FINALPACKAGE = 1
ARCHS = arm64
TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = DownloadManager
$(TWEAK_NAME)_FRAMEWORKS = UIKit Foundation AVFoundation Photos
$(TWEAK_NAME)_CFLAGS = -fobjc-arc -Wno-unused-function -I/tmp/YTLite_nospace/YouTubeHeader -I/tmp/YTLite_nospace/ -I.
$(TWEAK_NAME)_FILES = $(wildcard *.x)

include $(THEOS_MAKE_PATH)/tweak.mk
