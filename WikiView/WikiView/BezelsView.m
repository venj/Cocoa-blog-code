//
//  BezelsView.m
//  WikiView
//
//  Created by Venj Chu on 11/08/05.
//  Copyright 2011年 Home. All rights reserved.
//

#import "BezelsView.h"

@implementation BezelsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    CGFloat radius = (width + height) * 0.05;
    
    assert(radius <= (width < height ? width : height));
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, radius, 0);
    
    CGContextAddLineToPoint(context, width - radius, 0);
    CGContextAddArc(context, width - radius, radius, radius, -0.5 * M_PI, 0.0, 0);
    
    CGContextAddLineToPoint(context, width, height - radius);
    CGContextAddArc(context, width - radius, height - radius, radius, 0.0, 0.5 * M_PI, 0);
    
    CGContextAddLineToPoint(context, radius, height);
    CGContextAddArc(context, radius, height - radius, radius, 0.5 * M_PI, M_PI, 0);
    
    CGContextAddLineToPoint(context, 0, radius);
    CGContextAddArc(context, radius, radius, radius, M_PI, 1.5 * M_PI, 0);
    
    CGContextClosePath(context);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 0.5);
    CGContextDrawPath(context, kCGPathFill);
}

@end
