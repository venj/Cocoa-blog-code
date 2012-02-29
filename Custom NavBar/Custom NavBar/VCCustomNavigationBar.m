//
//  VCCustomNavigationBar.m
//  Custom NavBar
//
//  Created by 朱 文杰 on 12-2-29.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import "VCCustomNavigationBar.h"

@implementation VCCustomNavigationBar
@synthesize navigationBarBackgroundImage = _navigationBarBackgroundImage;
@synthesize landscapeBarBackground = _landscapeBarBackground;
@synthesize portraitBarBackground = _portraitBarBackground;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeBackgroundImage:) name:UIDeviceOrientationDidChangeNotification object:NULL];
}

- (void)drawRect:(CGRect)rect
{
    if (self.navigationBarBackgroundImage)
        [self.navigationBarBackgroundImage.image drawInRect:rect];
    else
        [super drawRect:rect];
}

- (void)setBackgroundForDeviceOrientation:(UIDeviceOrientation)orientation;
{
    self.navigationBarBackgroundImage = [[UIImageView alloc] initWithFrame:self.frame];
    if ((orientation == UIDeviceOrientationLandscapeLeft) 
        || (orientation == UIDeviceOrientationLandscapeRight)) {
        self.navigationBarBackgroundImage.image = self.landscapeBarBackground;
    }
    else if (orientation == UIDeviceOrientationPortrait) {
        self.navigationBarBackgroundImage.image = self.portraitBarBackground;
    }
    [self setNeedsDisplay];
}

- (void)clearBackground
{
    self.navigationBarBackgroundImage = nil;
    [self setNeedsDisplay];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)changeBackgroundImage:(NSNotification *)notification {
    UIDeviceOrientation currentOrientation = [[UIDevice currentDevice] orientation];
    if (currentOrientation == UIDeviceOrientationPortraitUpsideDown) {
        return;
    }
    [self setBackgroundForDeviceOrientation:currentOrientation];
}

@end
