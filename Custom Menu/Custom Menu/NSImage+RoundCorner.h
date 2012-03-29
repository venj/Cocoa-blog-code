//
//  NSImage+RoundCorner.h
//  Custom Menu
//
//  Created by 朱 文杰 on 12-3-25.
//  Copyright (c) 2012年 Home. All rights reserved.
//

/* NSImage+RoundCorner.h */
#import <Foundation/Foundation.h>
/* C Prototypes */
void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight);

@interface NSImage(RoundCorner)
- (NSImage *)roundCornersImageCornerRadius:(NSInteger)radius;
@end


