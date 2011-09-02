//
//  DockIconView.m
//  Play With Dock
//
//  Created by Venj Chu on 11/09/02.
//  Copyright (c) 2011年 Home. All rights reserved.
//

#import "DockIconView.h"

@implementation DockIconView

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
    NSImage *image = [NSImage imageNamed:@"qq"];
    NSImageView *imageView = [[NSImageView alloc] initWithFrame:self.frame];
    imageView.image = image;
    [self addSubview:imageView];
    [imageView release];
}

@end
