// YTVideoOverlay Init - for YouSpeed and YouMod Download integration
#import "Header.h"
#import <YouTubeHeader/YTMainAppControlsOverlayView.h>
#import <YouTubeHeader/YTInlinePlayerBarContainerView.h>
#import <YouTubeHeader/_ASDisplayView.h>

extern void YouModConfigureDownloadButton(_ASDisplayView *view);

static char overlayButtonsKey;

%group YTVideoOverlayGroup

%hook _ASDisplayView
- (void)didMoveToWindow {
    %orig;
    YouModConfigureDownloadButton(self);
}
%end

%hook YTMainAppControlsOverlayView

%new
- (NSMutableDictionary *)overlayButtons {
    NSMutableDictionary *buttons = objc_getAssociatedObject(self, &overlayButtonsKey);
    if (!buttons) {
        buttons = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &overlayButtonsKey, buttons, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return buttons;
}

%new
- (void)setOverlayButtons:(NSMutableDictionary *)overlayButtons {
    objc_setAssociatedObject(self, &overlayButtonsKey, overlayButtons, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

%end

%hook YTInlinePlayerBarContainerView

%new
- (NSMutableDictionary *)overlayButtons {
    NSMutableDictionary *buttons = objc_getAssociatedObject(self, &overlayButtonsKey);
    if (!buttons) {
        buttons = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &overlayButtonsKey, buttons, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return buttons;
}

%new
- (void)setOverlayButtons:(NSMutableDictionary *)overlayButtons {
    objc_setAssociatedObject(self, &overlayButtonsKey, overlayButtons, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

%end

%end

// Tweak key - will be defined by the tweak
NSString *TweakKey = @"YTVideoOverlay";

// Stub function - actual button creation is handled in YouSpeed.x hooks
void initYTVideoOverlay(NSString *tweakKey, NSDictionary *settings) {
    NSLog(@"[YTVideoOverlay] Initialized for %@ with settings: %@", tweakKey, settings);
    TweakKey = tweakKey;
}

%ctor {
    %init;
    %init(YTVideoOverlayGroup);
}

