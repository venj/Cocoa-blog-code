//
//  DockIconBadgeView.m
//  Play With Dock
//
//  Created by Venj Chu on 11/09/02.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import "DockIconBadgeView.h"

@implementation DockIconBadgeView
@synthesize label = _label;
@synthesize labelText = _labelText;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    
    // Draw Dock Icon
    NSImage *image = [NSImage imageNamed:@"qqbadge"];
    NSImageView *imageView = [[NSImageView alloc] initWithFrame:self.frame];
    imageView.image = image;
    [self addSubview:imageView];
    [imageView release];
    
    // Draw Badge Label
    NSRect labelFrame;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    labelFrame.origin = CGPointMake(width * 0.62, height * 0.60);
    labelFrame.size = CGSizeMake(width * 0.25, height * 0.25);
    self.label = [[NSTextField alloc] initWithFrame:labelFrame];
    self.label.backgroundColor = [NSColor clearColor];
    self.label.textColor = [NSColor whiteColor];
    self.label.drawsBackground = NO;
    self.label.stringValue = self.labelText;
    NSFont *font = [NSFont fontWithName:@"Arial" size:32];
    [self.label setFont:font];
    [self.label sizeToFit];
    [self.label setBordered:NO];
    [self addSubview:self.label];
    [self.label release];
}

@end
