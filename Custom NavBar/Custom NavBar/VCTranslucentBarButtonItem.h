//
//  VCTranslucentBarButtonItem.h
//  Custom NavBar
//
//  Created by 朱 文杰 on 12-2-29.
//  Copyright (c) 2012年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    VCTranslucentBarButtonItemTypeForward = 0,
    VCTranslucentBarButtonItemTypeNormal,
    VCTranslucentBarButtonItemTypeBackward
} VCTranslucentBarButtonItemType;

@interface VCTranslucentBarButtonItem : UIBarButtonItem
@property (nonatomic, assign) VCTranslucentBarButtonItemType type;

- (id)initWithType:(VCTranslucentBarButtonItemType)theType title:(NSString *)title target:(id)target action:(SEL)action;
@end
