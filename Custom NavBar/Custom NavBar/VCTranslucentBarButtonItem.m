//
//  VCTranslucentBarButtonItem.m
//  Custom NavBar
//
//  Created by 朱 文杰 on 12-2-29.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "VCTranslucentBarButtonItem.h"

@implementation VCTranslucentBarButtonItem
@synthesize type = _type;

+ (UIImage *)backgroundImageWithType:(VCTranslucentBarButtonItemType)theType {
    NSString *filename;
    UIImage *originalImage, *buttonImage;
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    NSInteger leftcap, rightcap;
    switch (theType) {
        case VCTranslucentBarButtonItemTypeForward:{
            filename = @"forwardbutton";
            leftcap = 8;
            rightcap = 13;
            break;
        }
        case VCTranslucentBarButtonItemTypeBackward: {
            filename = @"backwardbutton";
            leftcap = 13;
            rightcap = 8;
            break;
        }
        case VCTranslucentBarButtonItemTypeNormal:
        default: {
            filename = @"normalbutton";
            leftcap = 5;
            rightcap = 5;
            break;
        }
    }
    
    if ((orientation == UIDeviceOrientationLandscapeLeft) || (orientation == UIDeviceOrientationLandscapeRight)) {
        originalImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_landscape", filename]];
    }
    else {
        originalImage = [UIImage imageNamed:filename];
    }
    if ([[UIImage class] respondsToSelector:@selector(resizableImageWithCapInsets:)]) {
        buttonImage = [originalImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, leftcap, 0, rightcap)];
    }
    else {
        buttonImage = [originalImage stretchableImageWithLeftCapWidth:leftcap topCapHeight:0];
    }
    return buttonImage;
}

+ (UIButton *)buttonWithTitle:(NSString *)title type:(VCTranslucentBarButtonItemType)theType {
    UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [[self class] backgroundImageWithType:theType];
    [aButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [aButton setTitle:title forState:UIControlStateNormal];
    UIFont *font = [UIFont boldSystemFontOfSize:12];
    aButton.titleLabel.font = font;
    CGSize labelSize = [title sizeWithFont:font];
    aButton.titleLabel.shadowColor = [UIColor grayColor];
    aButton.titleLabel.shadowOffset = CGSizeMake(0.0, -1.0);
    aButton.frame = CGRectMake(0, 0, labelSize.width + buttonImage.size.width, buttonImage.size.height);
    return aButton;
}

- (id)initWithType:(VCTranslucentBarButtonItemType)theType title:(NSString *)title target:(id)target action:(SEL)action {
    
    UIButton *button = [[self class] buttonWithTitle:title type:theType];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    if ((self = [super initWithCustomView:button])) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeButtonBackground:) name:UIDeviceOrientationDidChangeNotification object:nil];
        self.type = theType;
        self.target = target;
        self.title = title;
        self.action = action;
    }
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)changeButtonBackground:(NSNotification *)notification {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if ((orientation == UIDeviceOrientationPortraitUpsideDown)
        || (orientation == UIDeviceOrientationFaceUp)
        || (orientation == UIDeviceOrientationFaceDown)
        || (orientation == UIDeviceOrientationUnknown)) {
        return;
    }
    
    UIButton *button = [[self class] buttonWithTitle:self.title type:self.type];
    [button addTarget:self.target action:self.action forControlEvents:UIControlEventTouchUpInside];
    
    self.customView = button;
}


@end
